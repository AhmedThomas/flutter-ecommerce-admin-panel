// ignore_for_file: depend_on_referenced_packages

import 'package:ecommerce_app_backend/models/order_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:intl/intl.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({required this.orderStats, super.key});

  final List<OrderStats> orderStats;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
        id: 'orders',
        data: orderStats,
        domainFn: (series, _) =>
            DateFormat.Md().format(series.dateTime).toString(),
        measureFn: (series, _) => series.orders,
        colorFn: (series, _) => series.barColor!,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
