
class OrderDetail {
  final int orderDetailId;
  final String productId;
  final int quantity;
  final double unitPrice;
  final int orderId;

  OrderDetail({
    required this.orderDetailId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.orderId,
  });

  @override
  String toString() {
    return 'OrderDetail(orderId: $orderDetailId, productId: $productId, quantity: $quantity, price: $unitPrice)';
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json['id'] as int,
      productId: json['producto'] as String,
      quantity: json['cantidad'] as int,
      unitPrice: (json['precio_unitario'] as num).toDouble(),
      orderId: json['pedido'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': orderDetailId,
      'producto': productId,
      'cantidad': quantity,
      'precio_unitario': unitPrice,
      'pedido': orderId,
    };
  }
}