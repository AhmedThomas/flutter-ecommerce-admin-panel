// ignore_for_file: depend_on_referenced_packages

import 'package:ecommerce_app_backend/view/shared/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';

class OrderCard extends StatelessWidget {
  OrderCard({required this.order, super.key});

  final Order order;
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p10,
        right: AppPadding.p10,
        top: AppPadding.p10,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        'Date:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        'Product ID:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        'Subtotal:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        'Delivery Fee:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        'Total:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${order.id}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        DateFormat('dd-MM-yy').format(order.createdAt),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        '${order.productIds}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        '${order.subtotal}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        '${order.deliveryFee}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Text(
                        '${order.total}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  order.isAccepted
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accept,
                            minimumSize: const Size(AppSize.s150, AppSize.s40),
                          ),
                          onPressed: () {
                            orderController.updateOrder(
                              order,
                              'isDelivered',
                              !order.isDelivered,
                            );
                          },
                          child: Text('Deliver',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppColors.secondary)),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accept,
                            minimumSize: const Size(AppSize.s150, AppSize.s40),
                          ),
                          onPressed: () {
                            orderController.updateOrder(
                              order,
                              'isAccepted',
                              !order.isAccepted,
                            );
                          },
                          child: Text('Accept',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppColors.secondary)),
                        ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cancel,
                      minimumSize: const Size(AppSize.s150, AppSize.s40),
                    ),
                    onPressed: () {
                      orderController.updateOrder(
                        order,
                        'isCancelled',
                        !order.isCancelled,
                      );
                    },
                    child: Text('Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColors.secondary)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
