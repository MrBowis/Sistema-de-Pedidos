from django.contrib import admin
from .models import Pedido, DetallePedido

class DetallePedidoInline(admin.TabularInline):
    model = DetallePedido
    extra = 1

class PedidoAdmin(admin.ModelAdmin):
    inlines = [DetallePedidoInline]
    list_display = ('id', 'cliente', 'fecha')

admin.site.register(Pedido, PedidoAdmin)
admin.site.register(DetallePedido)
