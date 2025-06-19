//importar riverpod, entities, datasource, repositories, usercases
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/order_detail.dart';
import '../../data/datasource/order_api.dart';
import '../../data/repositories/order_detail_repositories_impl.dart';
import '../../application/usercases/order_detail_usercases.dart';

final orderDetailProvider = StateNotifierProvider.family<
    OrderDetailNotifier, AsyncValue<List<OrderDetail>>, int>((ref, id) {
  final useCases = ref.watch(orderDetailUserCasesProvider);
  return OrderDetailNotifier(useCases)..fetchOrderDetails(id);
});


final orderDetailApiProvider = Provider<OrderApi>((ref) {
  return OrderApi();
});

final orderDetailRepositoryProvider = Provider<OrderDetailRepositoryImpl>((
  ref,
) {
  final orderDetailApi = ref.watch(orderDetailApiProvider);
  return OrderDetailRepositoryImpl(orderDetailApi);
});

final orderDetailUserCasesProvider = Provider<OrderDetailUserCases>((ref) {
  final orderDetailRepository = ref.watch(orderDetailRepositoryProvider);
  return OrderDetailUserCases(orderDetailRepository);
});

class OrderDetailNotifier extends StateNotifier<AsyncValue<List<OrderDetail>>> {
  final OrderDetailUserCases orderDetailUserCases;

  OrderDetailNotifier(this.orderDetailUserCases)
      : super(const AsyncValue.loading());

  Future<void> fetchOrderDetails(int id) async {
    try {
      final orderDetails = await orderDetailUserCases.getOrderDetailById(id);
      state = AsyncValue.data(orderDetails);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createOrderDetail(int id, OrderDetail orderDetail) async {
    try {
      final newOrderDetail =
          await orderDetailUserCases.createOrderDetail(id, orderDetail);
      state = AsyncValue.data([...state.value ?? [], newOrderDetail]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
