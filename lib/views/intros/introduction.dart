import 'package:finco/utils/colors.dart';
import 'package:finco/views/intros/intro1.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kara.background,
      body: Container(
        child: PageView(
          children: [
            Intro1()
          ],
        ),
      ),
    );
  }
}
