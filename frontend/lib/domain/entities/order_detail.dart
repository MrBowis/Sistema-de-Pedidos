
class OrderDetail {
  final int orderDetailId;
  final String product;
  final int quantity;
  final double unitPrice;
  final int orderId;

  OrderDetail({
    required this.orderDetailId,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.orderId,
  });

  @override
  String toString() {
    return 'OrderDetail(orderId: $orderDetailId, productId: $product, quantity: $quantity, price: $unitPrice)';
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json['id'] as int,
      product: json['producto'] as String,
      quantity: json['cantidad'] as int,
      unitPrice: double.parse(json['precio_unitario'].toString()),
      orderId: json['pedido'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': orderDetailId,
      'producto': product,
      'cantidad': quantity,
      'precio_unitario': unitPrice,
      'pedido': orderId,
    };
  }
}