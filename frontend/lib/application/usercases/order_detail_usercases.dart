//importar entities y repositories
import '../../domain/entities/order_detail.dart';
import '../../data/repositories/order_detail_repositories_impl.dart';

class OrderDetailUserCases {
  final OrderDetailRepositoryImpl orderDetailRepository;

  OrderDetailUserCases(this.orderDetailRepository);

  Future<List<OrderDetail>> getOrderDetailById(
    int id,
  ) async {
    return await orderDetailRepository.getOrderDetailByID(id);
  }

  Future<OrderDetail> createOrderDetail(int id, OrderDetail orderDetail) async {
    return await orderDetailRepository.createOrderDetail(id, orderDetail);
  }
}
