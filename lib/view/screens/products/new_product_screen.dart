// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:ecommerce_app_backend/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/config/config.dart';
import '../../../controllers/controllers.dart';
import '../../../services/services.dart';
import '../../shared/widgets/widgets.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final ProductController productController = Get.find();

  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.newProductTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.primary,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            ImagePicker _picker = ImagePicker();
                            final XFile? _image = await _picker.pickImage(
                                source: ImageSource.gallery);

                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(AppStrings.noImageFound),
                                ),
                              );
                            }
                            if (_image != null) {
                              await storage.uploadImage(_image);
                              var imageUrl =
                                  await storage.getDownloadURL(_image.name);

                              productController.newProduct.update(
                                  'imageUrl', (_) => imageUrl,
                                  ifAbsent: () => imageUrl);
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.secondary,
                          ),
                        ),
                        Text(
                          'Choose Image',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s20),
                Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline6,
                ),
                _buildTextFormField(
                  'Product ID',
                  'id',
                  productController,
                ),
                _buildTextFormField(
                  'Product Name',
                  'name',
                  productController,
                ),
                _buildTextFormField(
                  'Product Category',
                  'category',
                  productController,
                ),
                _buildTextFormField(
                  'Product Description',
                  'description',
                  productController,
                ),
                const SizedBox(height: AppSize.s10),
                _buildSlider(
                  context,
                  'Price',
                  'price',
                  productController,
                  productController.price,
                ),
                _buildSlider(
                  context,
                  'Quantity',
                  'quantity',
                  productController,
                  productController.quantity,
                ),
                const SizedBox(height: AppSize.s10),
                _buildCheckBox(
                  context,
                  'Recommended',
                  'isRecommended',
                  productController,
                  productController.isRecommended,
                ),
                _buildCheckBox(
                  context,
                  'Popular',
                  'isPopular',
                  productController,
                  productController.isPopular,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      database.addProduct(
                        Product(
                          id: int.parse(productController.newProduct['id']),
                          name: productController.newProduct['name'],
                          category: productController.newProduct['category'],
                          description:
                              productController.newProduct['description'],
                          imageUrl: productController.newProduct['imageUrl'],
                          isRecommended:
                              productController.newProduct['isRecommended'],
                          isPopular: productController.newProduct['isPopular'],
                          price: productController.newProduct['price'],
                          quantity:
                              productController.newProduct['quantity'].toInt(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppColors.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCheckBox(
    BuildContext context,
    String title,
    String name,
    ProductController productController,
    bool? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.s125,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: AppColors.primary,
          activeColor: AppColors.slider,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }

  Row _buildSlider(
    BuildContext context,
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.s75,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0.0,
            max: 1000.0,
            divisions: 100,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.slider,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
