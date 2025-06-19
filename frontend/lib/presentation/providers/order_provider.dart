//importar riverpod, entities, datasource, repositories, usercases
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/order.dart';
import '../../data/datasource/order_api.dart';
import '../../data/repositories/order_repositories_impl.dart';
import '../../application/usercases/order_usercases.dart';

final orderProvider =
    StateNotifierProvider<OrderNotifier, AsyncValue<List<Order>>>((ref) {
      return OrderNotifier();
    });

final orderApiProvider = Provider<OrderApi>((ref) {
  return OrderApi();
});

final orderRepositoryProvider = Provider<OrderRepositoryImpl>((ref) {
  final orderApi = ref.watch(orderApiProvider);
  return OrderRepositoryImpl(orderApi);
});

final orderUserCasesProvider = Provider<OrderUserCases>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  return OrderUserCases(orderRepository);
});

class OrderNotifier extends StateNotifier<AsyncValue<List<Order>>> {
  final OrderUserCases orderUserCases = OrderUserCases(
    OrderRepositoryImpl(OrderApi()),
  );
  OrderNotifier() : super(AsyncValue.loading()) {
    fetchOrders();
  }

  void fetchOrders() async {
    try {
      final orders = await orderUserCases.getOrders();
      state = AsyncValue.data(orders);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createOrder(String cliente) async {
    try {
      final newOrder = await orderUserCases.createOrder(cliente);
      state = AsyncValue.data([...state.value ?? [], newOrder]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Future<void> updateOrder(Order order) async {
  //   try {
  //     final updatedOrder = await orderUserCases.updateOrder(order);
  //     final orders =
  //         state.value
  //             ?.map((c) => c.id == updatedOrder.id ? updatedOrder : c)
  //             .toList() ??
  //         [];
  //     state = AsyncValue.data(orders);
  //   } catch (e) {
  //     state = AsyncValue.error(e, StackTrace.current);
  //   }
  // }

  // Future<void> deleteOrder(int id) async {
  //   try {
  //     await orderUserCases.deleteOrder(id);
  //     final orders = state.value?.where((c) => c.id != id).toList() ?? [];
  //     state = AsyncValue.data(orders);
  //   } catch (e) {
  //     state = AsyncValue.error(e, StackTrace.current);
  //   }
  // }
}
