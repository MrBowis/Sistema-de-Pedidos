from django.db import models

# Create your models here.
class Pedido(models.Model):
    id = models.AutoField(primary_key=True)
    cliente = models.CharField(max_length=100)
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Pedido {self.id} - Cliente: {self.cliente} - Fecha: {self.fecha.strftime('%Y-%m-%d %H:%M:%S')}"

class DetallePedido(models.Model):
    id = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, related_name='detalles', on_delete=models.CASCADE)
    producto = models.CharField(max_length=100)
    cantidad = models.PositiveIntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"Detalle {self.id} - Pedido: {self.pedido.id} - Producto: {self.producto} - Cantidad: {self.cantidad} - Precio Unitario: {self.precio_unitario}"
    
    # Un pedido tiene muchos detalles, y cada detalle pertenece a un pedido.
    class Meta:
        verbose_name = 'Detalle de Pedido'
        verbose_name_plural = 'Detalles de Pedidos'
        ordering = ['pedido', 'producto']