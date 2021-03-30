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


# Vlastnosti účtu
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showProperties(request):
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
def changeProperties(request):
    try:
        account = request.user
    except Account.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    serializer = AccountPropertiesSerializer(account, data=request.data)
    data = {}
    serializer.is_valid(raise_exception=True)
    serializer.save()
    data["response"] = "Account update success"
    return Response(data=data)
    # return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Zobraziť všetky udalosti
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showAllEvents(request):

    user = request.user
    event = Event.objects.filter(userID=user.id).order_by('-id')
    serializer = EventSerializer(event, many=True)
    return Response(serializer.data)


# Zobraziť konkrétnu udalosť
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def showEventDetails(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.userID != user.id:
        return Response({"response": "You don't have the permission to view these events."})


    serializer = EventSerializer(event, many=False)
    return Response(serializer.data)


# Vytvoriť udalosť
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def createEvent(request):
    serializer = EventSerializer(data=request.data)
    user = request.user
    values = request.POST.copy()
    values["userID"] = user.id

    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


# Zmeniť udalosť
@api_view(['PUT'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def updateEvent(request, pk):
    try:
        event = Event.objects.get(id=pk)
    except Event.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    user = request.user
    if event.userID != user.id:
        return Response({"response": "You don't have the permission to edit that event."})

    serializer = EventSerializer(instance=event, data=request.data)

    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)


# Odstrániť udalosť
@api_view(['DELETE'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def deleteEvent(request, pk):
    event = Event.objects.get(id=pk)
    event.delete()

    return Response('Event succesfully deleted!')
