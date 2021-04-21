from django.utils.datastructures import MultiValueDictKeyError
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Event, Account
from .serializers import UsernameSerializer, ChangePasswordSerializer, EmailAddressSerializer, \
    AccountPropertiesSerializer
from .serializers import EventSerializer
from .serializers import RegisterSerializer


class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        response = super(CustomObtainAuthToken, self).post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data['token'])
        return Response({'token': token.key, 'user': {'id': token.user_id}})


# Registrácia
@api_view(['POST'])
def registerUser(request):
    serializer = RegisterSerializer(data=request.data)
    data = {}
    if serializer.is_valid():
        account = serializer.save()
        data["response"] = "Successful registration!"
        data["email"] = account.email
        data["username"] = account.username
        token = Token.objects.get(user=account).key
        data["token"] = token
        return Response(data, status=status.HTTP_200_OK)

    else:
        data = serializer.errors
        return Response(data, status=status.HTTP_400_BAD_REQUEST)


# Odhlásenie sa
@api_view(['POST'])
def logoutUser(request):
    try:
        request.user.auth_token.delete()
        return Response({"response": "Successfully logged out."}, status=status.HTTP_200_OK)
    except AttributeError:
        return Response({"response": "No token was provided."}, status=status.HTTP_401_UNAUTHORIZED)


# Informácie o účte
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showAccountInfo(request):
    try:
        account = request.user
    except (Account.DoesNotExist, AttributeError):
        return Response(status=status.HTTP_404_NOT_FOUND)
    serializer = AccountPropertiesSerializer(account)
    return Response(serializer.data)


# Zmeniť heslo k účtu
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def changePassword(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = ChangePasswordSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    if not account.check_password(serializer.data.get("old_password")):
        return Response({"old_password": ["Wrong password."]}, status=status.HTTP_400_BAD_REQUEST)

    account.set_password(serializer.data.get("new_password"))
    account.save()

    return Response({"response": "The password was updated."}, status=status.HTTP_200_OK)


# Zmeniť username alebo email k účtu
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def changeUsername(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = UsernameSerializer(account, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    return Response(serializer.data)


# Zmeniť username alebo email k účtu
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def changeEmailAddress(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = EmailAddressSerializer(account, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    return Response(serializer.data)


# Vytvoriť udalosť
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def createEvent(request):
    user = request.user
    values = request.POST.copy()

    try:
        pic = request.FILES["pic"]
    except MultiValueDictKeyError:
        pic = None

    values["user"] = user.id
    values["pic"] = pic
    serializer = EventSerializer(data=values)

    serializer.is_valid(raise_exception=True)
    serializer.save()

    return Response(serializer.data)


# Zobraziť všetky udalosti
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showAllEvents(request):
    user = request.user
    event = Event.objects.filter(user=user.id).order_by('-id')
    serializer = EventSerializer(event, many=True)
    return Response({'events': serializer.data})


# Zobraziť konkrétnu udalosť
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showEventByID(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response({"response": "The requested event does not exist."}, status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.user.id != user.id:
        return Response({"response": "You don't have the permission to view this event."},
                        status=status.HTTP_401_UNAUTHORIZED)

    serializer = EventSerializer(event, many=False)
    return Response(serializer.data)


# Zmeniť udalosť
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def updateEvent(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response({"response": "The requested event does not exist."}, status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.user.id != user.id:
        return Response({"response": "You don't have the permission to edit this event."},
                        status=status.HTTP_401_UNAUTHORIZED)

    values = request.POST.copy()
    try:
        pic = request.FILES["pic"]
    except MultiValueDictKeyError:
        pic = None
    values["user"] = event.user.id
    values["pic"] = pic
    serializer = EventSerializer(instance=event, data=values)

    serializer.is_valid(raise_exception=True)
    serializer.save()

    return Response(serializer.data)


# Odstrániť udalosť
@api_view(['DELETE'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def deleteEvent(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response({"response": "The requested event does not exist."}, status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.user.id != user.id:
        return Response({"response": "You don't have the permission to delete this event."},
                        status=status.HTTP_401_UNAUTHORIZED)

    event.delete()
    return Response({"response": "The event was deleted."}, status=status.HTTP_200_OK)
