import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/config/config.dart';
import '../../../controllers/controllers.dart';
import '../../shared/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.ordersTitle),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: orderController.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(order: orderController.orders[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
