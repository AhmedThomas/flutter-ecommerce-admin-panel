import 'package:ecommerce_app_backend/view/shared/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard({required this.product, required this.index, super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: AppMargin.m10),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: AppSize.s12),
            Row(
              children: [
                SizedBox(
                  height: AppSize.s80,
                  width: AppSize.s80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Expanded(
                            child: Slider(
                              value: product.price,
                              min: 0.0,
                              max: 1000.0,
                              divisions: 100,
                              activeColor: AppColors.primary,
                              inactiveColor: AppColors.slider,
                              onChanged: (value) {
                                productController.updateProductPrice(
                                  index,
                                  product,
                                  value,
                                );
                              },
                              onChangeEnd: (value) {
                                productController.saveNewProductPrice(
                                  product,
                                  'price',
                                  value,
                                );
                              },
                            ),
                          ),
                          Text(
                            product.price.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Quantity',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Expanded(
                            child: Slider(
                              value: product.quantity.toDouble(),
                              min: 0.0,
                              max: 1000.0,
                              divisions: 100,
                              activeColor: AppColors.primary,
                              inactiveColor: AppColors.slider,
                              onChanged: (value) {
                                productController.updateProductQuantity(
                                  index,
                                  product,
                                  value.toInt(),
                                );
                              },
                              onChangeEnd: (value) {
                                productController.saveNewProductQuantity(
                                  product,
                                  'quantity',
                                  value.toInt(),
                                );
                              },
                            ),
                          ),
                          Text(
                            '${product.quantity.toInt()}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s12),
            Expanded(
              child: Text(
                product.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
