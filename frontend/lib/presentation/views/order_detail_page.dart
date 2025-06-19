import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/presentation/providers/order_detail_provider.dart';
import 'package:frontend/presentation/views/order_detail_form.dart';
import 'package:frontend/presentation/widgets/order_detail_card.dart';

class OrderDetailPage extends ConsumerWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = args['id'] is int
        ? args['id']
        : int.parse(args['id'].toString());
    final orderState = ref.watch(orderDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(orderDetailProvider(id).notifier).fetchOrderDetails(id);
            },
          ),
        ],
      ),
      body: orderState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (orderDetails) {
          if (orderDetails.isEmpty) {
            return const Center(child: Text('No orders found.'));
          }
          return ListView.builder(
            itemCount: orderDetails.length,
            itemBuilder: (context, index) {
              return OrderDetailCard(orderDetail: orderDetails[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailForm(orderId: id),
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Create New Order',
      ),
    );
  }
}
