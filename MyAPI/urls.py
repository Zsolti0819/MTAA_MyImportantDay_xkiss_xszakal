from rest_framework.authtoken.views import obtain_auth_token

from . import views
from django.urls import path
from .views import CustomObtainAuthToken

urlpatterns = [
    path('register/', views.registerUser, name='register'),
    path('login/', CustomObtainAuthToken.as_view()),
    path('logout/', views.logoutUser, name='logout'),
    path('account/', views.showAccountInfo, name='properties'),
    path('account/password/', views.changePassword, name='change-password'),
    path('account/properties/', views.changeUsernameAndEmail, name='update'),


    path('events/', views.createEvent, name="event-create"),
    path('events/all/', views.showAllEvents, name="event-list"),
    path('events/<str:pk>/', views.showEventByID, name="event-detail"),
    path('events/<str:pk>/update/', views.updateEvent, name="event-update"),
    path('events/<str:pk>/delete/', views.deleteEvent, name="event-delete"),

]
