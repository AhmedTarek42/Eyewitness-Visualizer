import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class HomeChart extends StatelessWidget {
  const HomeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series:
      <CircularSeries>[
        RadialBarSeries<RadialData, String>(
          dataSource: getData(),
          xValueMapper: (RadialData data, _) => data.category,
          yValueMapper: (RadialData data, _) => data.value,
          pointColorMapper: (RadialData data, _) => data.color,
        )
      ],
    );
  }

}

List<RadialData> getData() {
  final List<RadialData> chartData = [
    RadialData('Category 1', 0, const Color(0xFFFF7966)),
    RadialData('Category 1', 210, const Color(0xFFFF7966)),
    RadialData('Total Images', 70, const Color(0xFFFF7966)),
  ];
  return chartData;
}

class RadialData {
  final String category;
  final double value;
  final Color color;

  RadialData(this.category, this.value, this.color);
}