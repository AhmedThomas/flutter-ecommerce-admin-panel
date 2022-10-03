import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/config/config.dart';
import '../../shared/widgets/widgets.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.homeTitle,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            homeCards(
              context: context,
              title: AppStrings.goToProducts,
              onTap: () {
                Get.to(() => ProductsScreen());
              },
            ),
            const SizedBox(height: AppSize.s12),
            homeCards(
              context: context,
              title: AppStrings.goToOrders,
              onTap: () {
                Get.to(() => OrdersScreen());
              },
            ),
            // HomeCardsContainer(title: AppStrings.goToProducts),
          ],
        ),
      ),
    );
  }
}
