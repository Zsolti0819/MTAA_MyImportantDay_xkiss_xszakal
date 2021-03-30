from rest_framework import serializers
from .models import Event, Account


# Register Serializer
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ["email", "username", "password"]
        extra_kwargs = {
            "password": {"write_only": True}
        }

    def save(self):
        account = Account(
            email=self.validated_data["email"],
            username=self.validated_data["username"], )
        password = self.validated_data["password"]

        account.set_password(password)
        account.save()

        return account


# Account properties Serializer
class AccountPropertiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ["username", "email"]


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = "__all__"
