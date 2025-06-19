import 'package:frontend/domain/entities/order_detail.dart';

class Order {
  final int id;
  final String customerName;
  final DateTime? date;
  final List<OrderDetail> orderDetail = [];

  Order({
    required this.id,
    required this.customerName,
    required this.date,
    required List<OrderDetail> orderDetail,
  });

  @override
  String toString() {
    return 'Order{id: $id, customerName: $customerName}';
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      customerName: json['cliente'] as String,
      date: json['fecha'] != null ? DateTime.parse(json['fecha']) : null,
      orderDetail: (json['detalles'] as List)
          .map((item) => OrderDetail.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cliente': customerName,
      'fecha': date?.toIso8601String(),
      'detalles': orderDetail.map((item) => item.toJson()).toList(),
    };
  }
}
