//importar entities y repositories
import '../../domain/entities/order.dart';
import '../../data/repositories/order_repositories_impl.dart';

class OrderUserCases {
  final OrderRepositoryImpl orderRepository;

  OrderUserCases(this.orderRepository);

  Future<List<Order>> getOrders() async {
    return await orderRepository.getOrders();
  }

  Future<Order> createOrder(String cliente) async {
    return await orderRepository.createOrder(cliente);
  }
}
