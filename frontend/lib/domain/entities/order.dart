import 'package:frontend/domain/entities/order_detail.dart';

class Order {
  final int id;
  final String customerName;
  final List<OrderDetail> orderDetail = [];

  Order({
    required this.id,
    required this.customerName,
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
      orderDetail: (json['detalles'] as List)
          .map((item) => OrderDetail.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cliente': customerName,
      'detalles': orderDetail.map((item) => item.toJson()).toList(),
    };
  }
}
