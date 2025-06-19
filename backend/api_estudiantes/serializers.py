from rest_framework import serializers
from .models import Estudiante, Nota

class NotaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nota
        fields = '__all__'

class EstudianteSerializer(serializers.ModelSerializer):
    notas = NotaSerializer(many=True, read_only=True)

    class Meta:
        model = Estudiante
        fields = ['id', 'nombre', 'apellido', 'fecha_nacimiento', 'notas']
