import 'package:flutter/material.dart';

import '../config/config.dart';

Widget homeCards({
  required BuildContext context,
  required String title,
  Function? onTap,
}) =>
    InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: double.infinity,
        height: AppSize.s150,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        child: Card(
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    );

// class HomeCards extends StatelessWidget {
//   final String title;

//   const HomeCards({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         width: double.infinity,
//         height: AppSize.s150,
//         padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
//         child: Card(
//           child: Center(
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.headline1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// InkWell(
//         onTap: () {
//           Get.to(() => ProductsScreen());
//         },
//         child: Card(
//           child: Center(
//               child: Text(
//             title,
//             style: Theme.of(context).textTheme.headline1,
//           )),
//         ),
//       ),