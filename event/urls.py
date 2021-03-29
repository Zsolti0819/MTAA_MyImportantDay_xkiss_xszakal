from django.urls import path
from . import views

urlpatterns = [
	path('event-list/', views.eventList, name="event-list"),
	path('event-detail/<str:pk>/', views.eventDetail, name="event-detail"),
	path('event-create/', views.eventCreate, name="event-create"),
	path('event-update/<str:pk>/', views.eventUpdate, name="event-update"),
	path('event-delete/<str:pk>/', views.eventDelete, name="event-delete"),
]
