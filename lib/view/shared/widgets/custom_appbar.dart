import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/config.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
