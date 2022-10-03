import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/shared/config/config.dart';
import '../view/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Backend',
      theme: getApplicationTheme(),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/products', page: () => ProductsScreen()),
        GetPage(name: '/products/new', page: () => NewProductScreen()),
        GetPage(name: '/orders', page: () => OrdersScreen()),
      ],
    );
  }
}
