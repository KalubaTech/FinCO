import 'package:animated_number/animated_number.dart';
import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';


class StockPickItem extends StatelessWidget {
  String period;
  String figure;
  List<Color> colors;
  StockPickItem({required this.figure, required this.period, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('$period', style: TextStyle(color: Kara.background, fontSize: 12),),
          AnimatedNumber(
            prefixText: 'ZMK ',
            startValue: 0,
            endValue: int.parse(figure),
            duration: Duration(seconds: 2),
            isFloatingPoint: false,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: colors)
      ),
    );
  }
}
