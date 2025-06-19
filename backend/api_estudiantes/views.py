from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .models import Estudiante, Nota
from .serializers import EstudianteSerializer, NotaSerializer

class EstudianteView(viewsets.ModelViewSet):
    queryset = Estudiante.objects.all()
    serializer_class = EstudianteSerializer
    http_method_names = ['get', 'post']

    @action(detail=True, methods=['get', 'post'], url_path='notas', serializer_class=NotaSerializer)
    def notas(self, request, pk=None):
        estudiante = self.get_object()

        if request.method == 'GET':
            notas = estudiante.notas.all()
            serializer = NotaSerializer(notas, many=True)
            return Response(serializer.data)

        elif request.method == 'POST':
            data = request.data.copy()
            data['estudiante'] = estudiante.id
            serializer = NotaSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)