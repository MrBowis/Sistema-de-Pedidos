from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .models import Pedido, DetallePedido
from .serializers import PedidoSerializer, DetallePedidoSerializer

class PedidoViewSet(viewsets.ModelViewSet):
    queryset = Pedido.objects.all()
    serializer_class = PedidoSerializer
    http_method_names = ['get', 'post']

    @action(detail=True, methods=['get', 'post'], url_path='detalles', serializer_class=DetallePedidoSerializer)
    def detalles(self, request, pk=None):
        pedido = self.get_object()

        if request.method == 'GET':
            detalles = pedido.detalles.all()
            serializer = DetallePedidoSerializer(detalles, many=True)
            return Response(serializer.data)

        elif request.method == 'POST':
            data = request.data.copy()
            data['pedido'] = pedido.id
            serializer = DetallePedidoSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)