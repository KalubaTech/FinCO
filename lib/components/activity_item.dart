import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  Color barColor;
  String title;
  String subtitle;
  Widget? trailing;
  ActivityItem({required this.barColor, required this.title, required this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 4,
            color: barColor,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 12),),
                  Text(subtitle, style: TextStyle(fontSize: 10, color: Kara.greyish, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          trailing??Container()
        ],
      ),
    );
  }
}
