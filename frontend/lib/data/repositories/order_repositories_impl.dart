//importar order model, order_api
import '../../domain/entities/order.dart';
import '../datasource/order_api.dart';

class OrderRepositoryImpl {
  final OrderApi orderApi;

  OrderRepositoryImpl(this.orderApi);

  Future<List<Order>> getOrders() async {
    return await orderApi.fetchOrders();
  }

  Future<Order> createOrder(String cliente) async {
    return await orderApi.createOrder(cliente);
  }
}
