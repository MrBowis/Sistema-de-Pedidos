//importar order model, order_api
import 'package:frontend/domain/entities/order_detail.dart';
import '../datasource/order_api.dart';

class OrderDetailRepositoryImpl {
  final OrderApi orderApi;

  OrderDetailRepositoryImpl(this.orderApi);

  Future<List<OrderDetail>> getOrderDetailByID(int id) async {
    return await orderApi.getOrderDetailById(id);
  }

  Future<OrderDetail> createOrderDetail(int id, OrderDetail orderDetail) async {
    return await orderApi.createOrderDetail(id, orderDetail);
  }
}
