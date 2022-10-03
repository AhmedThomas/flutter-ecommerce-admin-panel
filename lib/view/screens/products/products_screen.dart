import 'package:ecommerce_app_backend/view/shared/config/config.dart';
import 'package:ecommerce_app_backend/view/screens/products/new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../shared/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.productsTitle),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s100,
              child: Card(
                margin: EdgeInsets.zero,
                color: AppColors.primary,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => NewProductScreen());
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      'Create a New Product',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: AppSize.s210,
                        child: ProductCard(
                          product: productController.products[index],
                          index: index,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
