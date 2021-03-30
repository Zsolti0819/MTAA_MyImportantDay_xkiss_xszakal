from rest_framework.authtoken.views import obtain_auth_token

from . import views
from django.urls import path

urlpatterns = [
    path('register/', views.registerUser, name='register'),
    path('login/', obtain_auth_token, name='login'),
    path('logout/', views.logoutUser, name='logout'),
    path('account/', views.showAccountInfo, name='properties'),
    path('account-update/', views.updateAccount, name='update'),
    path('event-list/', views.showAllEvents, name="event-list"),
    path('event/<str:pk>/', views.showEventDetails, name="event-detail"),
    path('event-create/', views.createEvent, name="event-create"),
    path('event-update/<str:pk>/', views.updateEvent, name="event-update"),
    path('event-delete/<str:pk>/', views.deleteEvent, name="event-delete"),

]
