import 'package:finco/controllers/user_controller.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/anchor.dart';
import 'package:finco/views/intros/introduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finco App',
      theme: ThemeData(
        primaryColor: Kara.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: Kara.primary),
        useMaterial3: true,
      ),
      home: Introduction(),
    );
  }
}
