import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../shared/config/config.dart';
import '../../shared/widgets/widgets.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

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
            FutureBuilder(
                future: orderStatsController.stats.value,
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderStats>> snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: AppSize.s250,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomBarChart(
                          orderStats: snapshot.data!,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }),
            // SizedBox(
            //   height: AppSize.s250,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: CustomBarChart(orderStats: OrderStats.data),
            //   ),
            // ),
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
          ],
        ),
      ),
    );
  }
}
