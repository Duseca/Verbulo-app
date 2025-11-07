import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

class GradientStackedBarChart extends StatelessWidget {
  final double? barWidth;
  final bool hasLabels;
  const GradientStackedBarChart({
    super.key,
    this.barWidth,
    this.hasLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('Mon', 60, 40, kMustard),
      _ChartData('Tue', 25, 55, kSecondaryColor),
      _ChartData('Wed', 90, 10, kSecondaryColor2),
      _ChartData('Thu', 45, 55, kSecondaryColor2),
      _ChartData('Fri', 70, 30, kMustard),
      _ChartData('Sat', 80, 20, kSecondaryColor),
      _ChartData('Sun', 60, 40, kMustard),
    ];

    return Center(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          isVisible: hasLabels,
          interval: 1,
          majorTickLines: MajorTickLines(width: 0),
          labelStyle: TextStyle(fontSize: 12, fontFamily: MANROPE),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(isVisible: false, minimum: 0, maximum: 100),
        series: <CartesianSeries>[
          // Filled portion
          ...List.generate(chartData.length, (index) {
            final data = chartData[index];
            return StackedColumnSeries<_ChartData, String>(
              dataSource: [data],
              xValueMapper: (data, _) => data.label,
              yValueMapper: (data, _) => data.filled,
              width: barWidth ?? 0.8,
              borderRadius: BorderRadius.circular(0),
              color: data.color,
            );
          }),

          // Grey remaining portion
          StackedColumnSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (data, _) => data.label,
            yValueMapper: (data, _) => data.remaining,
            width: barWidth ?? 0.8,
            opacity: 1,
            spacing: 0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: kGreyColor1,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final double filled;
  final double remaining;
  final Color color;
  _ChartData(this.label, this.filled, this.remaining, this.color);
}
