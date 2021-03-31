from rest_framework.authtoken.views import obtain_auth_token

from . import views
from django.urls import path


urlpatterns = [
    path('register/', views.registerUser, name='register'),
    path('login/', obtain_auth_token, name='login'),
    path('logout/', views.logoutUser, name='logout'),
    path('account/', views.showAccountInfo, name='properties'),
    path('account/properties/', views.changeUsernameOrEmail, name='update'),
    path('account/password/', views.changePassword, name='change-password'),

    path('events/', views.createEvent, name="event-create"),
    path('events/<str:pk>/', views.showEventDetails, name="event-detail"),
    path('events/all', views.showAllEvents, name="event-list"),
    path('events/<str:pk>/update/', views.updateEvent, name="event-update"),
    path('events/<str:pk>/delete/', views.deleteEvent, name="event-delete"),

]
