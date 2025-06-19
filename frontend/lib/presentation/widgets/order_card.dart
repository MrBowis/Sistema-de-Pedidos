import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text((order.customerName.isNotEmpty ? order.customerName[0] : '?')),
        ),
        title: Text(order.customerName),
        subtitle: Text('Fecha: ${order.date != null ? order.date!.toLocal().toString().split(' ')[0] : 'No date'}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/orderDetail',
            arguments: {'id': order.id} ,
          );
        },
      ),
    );
  }
}
