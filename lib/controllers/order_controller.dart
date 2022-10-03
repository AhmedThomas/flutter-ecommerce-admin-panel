import 'package:get/get.dart';

import '../models/models.dart';
import '../services/services.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    super.onInit();
  }
}
