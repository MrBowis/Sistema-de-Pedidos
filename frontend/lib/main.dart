import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/presentation/views/order_list_page.dart';
import 'package:frontend/presentation/views/order_detail_page.dart';
import 'package:frontend/presentation/views/order_form.dart';
import 'package:frontend/theme/app_themes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes().darkTheme,
      home: OrderListPage(),
      routes: {
        '/orderDetail': (context) => OrderDetailPage(),
        '/orderForm': (context) => OrderForm(),
        '/orderDetailForm': (context) => OrderForm(),
      },
    );
  }
}
