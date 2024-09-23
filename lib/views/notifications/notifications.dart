import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kara.primary,
        foregroundColor: Colors.white,
        title: Text('Notifications'),
      ),
    );
  }
}
