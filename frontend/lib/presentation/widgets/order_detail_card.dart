import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/order_detail.dart';

class OrderDetailCard extends StatelessWidget {
  final OrderDetail orderDetail;

  const OrderDetailCard({Key? key, required this.orderDetail})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            (orderDetail.product.isNotEmpty ? orderDetail.product[0] : '?'),
          ),
        ),
        title: Text(
          '${orderDetail.product} - ${orderDetail.quantity} x \$${orderDetail.unitPrice}',
        ),
        subtitle: Text(
          'Total: ${(orderDetail.quantity * orderDetail.unitPrice).toStringAsFixed(2)}',
        ),
      ),
    );
  }
}
