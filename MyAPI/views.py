from django.core.exceptions import ObjectDoesNotExist
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Event, Account
from .serializers import EventSerializer
from .serializers import RegisterSerializer
from .serializers import AccountPropertiesSerializer


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

    else:
        data = serializer.errors

    return Response(data)


# Odhlásenie sa
@api_view(['POST'])
def logoutUser(request):
    try:
        request.user.auth_token.delete()
        return Response({"response": "Successfully logged out."}, status=status.HTTP_200_OK)
    except (AttributeError, ObjectDoesNotExist):
        return Response({"response": "No token was provided."}, status=status.HTTP_412_PRECONDITION_FAILED)


# Informácie o účte
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showAccountInfo(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    serializer = AccountPropertiesSerializer(account)
    return Response(serializer.data)


# Zmeniť vlastnosti v účte
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def updateAccount(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = AccountPropertiesSerializer(account, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    return Response(serializer.data)  # HTTP STATUS CODE 200


# Zobraziť všetky udalosti
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showAllEvents(request):
    user = request.user
    event = Event.objects.filter(user=user.id).order_by('-id')
    serializer = EventSerializer(event, many=True)
    return Response(serializer.data)  # HTTP STATUS CODE 200


# Zobraziť konkrétnu udalosť
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showEventDetails(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response({"response": "The requested event does not exist."}, status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.user.id != user.id:
        return Response({"response": "You don't have the permission to view this event."},
                        status=status.HTTP_401_UNAUTHORIZED)

    serializer = EventSerializer(event, many=False)
    return Response(serializer.data)  # HTTP STATUS CODE 200


# Vytvoriť udalosť
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def createEvent(request):
    user = request.user
    values = request.POST.copy()
    values["user"] = user.id
    serializer = EventSerializer(data=values)

    serializer.is_valid(raise_exception=True)
    serializer.save()

    return Response(serializer.data)  # HTTP STATUS CODE 200


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
    values["user"] = event.user.id
    serializer = EventSerializer(instance=event, data=values)


    serializer.is_valid(raise_exception=True)
    serializer.save()

    return Response(serializer.data)  # HTTP STATUS CODE 200


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
    return Response({"response": "The event was successfully deleted."}, status=status.HTTP_200_OK)
