import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/order_detail_provider.dart';
import '../../domain/entities/order_detail.dart';

class OrderDetailForm extends ConsumerStatefulWidget {
  final int orderId; // ID del pedido al que se agregará el detalle

  const OrderDetailForm({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderDetailFormState createState() => _OrderDetailFormState();
}

class _OrderDetailFormState extends ConsumerState<OrderDetailForm> {
  final _formKey = GlobalKey<FormState>();
  String _producto = '';
  int _cantidad = 0;
  double _precioUnitario = 0.0;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await ref.read(orderDetailProvider(widget.orderId).notifier).createOrderDetail(
              widget.orderId,
              OrderDetail(
                orderDetailId: 0, // El backend lo asignará
                product: _producto,
                quantity: _cantidad,
                unitPrice: _precioUnitario,
                orderId: widget.orderId,
              ),
            );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Detalle de orden enviado.')),
        );
        _formKey.currentState!.reset();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Detalle de Orden')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Producto'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese el producto' : null,
                onSaved: (value) => _producto = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese la cantidad';
                  final n = int.tryParse(value);
                  if (n == null || n <= 0) return 'Cantidad inválida';
                  return null;
                },
                onSaved: (value) => _cantidad = int.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Precio Unitario'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese el precio';
                  final n = double.tryParse(value);
                  if (n == null || n <= 0) return 'Precio inválido';
                  return null;
                },
                onSaved: (value) => _precioUnitario = double.parse(value!),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Enviar Detalle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
