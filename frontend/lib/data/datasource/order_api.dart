import '../../domain/entities/order.dart';
import '../../domain/entities/order_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderApi {
  final String baseUrl = 'http://127.0.0.1:8000/api-pedidos/pedidos/';

  Future<List<Order>> fetchOrders() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  //crear ordero
  Future<Order> createOrder(String cliente) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'cliente': cliente,
      }),
    );

    if (response.statusCode == 201) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create order');
    }
  }

  // Obtener detalles de un pedido por ID
  Future<List<OrderDetail>> getOrderDetailById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$id/detalles/'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => OrderDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load order details');
    }
  }

  // Crear un detalle de pedido
  Future<OrderDetail> createOrderDetail(int id, OrderDetail orderDetail) async {
    final response = await http.post(
      Uri.parse('$baseUrl$id/detalles/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(orderDetail.toJson()),
    );

    if (response.statusCode == 201) {
      return OrderDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create order detail');
    }
  }
}
