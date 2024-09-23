import 'dart:io';

import 'package:finco/controllers/user_controller.dart';
import 'package:finco/models/user_model.dart';
import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardHeader extends StatelessWidget {
  DashboardHeader({super.key});

  UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {

    UserModel user = _userController.user.value;

    return Container(
      height: 200,
      width: double.infinity,
      color: Kara.primary,
      child: Column(
        children: [
          SizedBox(height: 50,),
          CircleAvatar(
            radius: 35,
            backgroundImage: FileImage(File(user.picture)),
          ),
          SizedBox(height: 20,),
          Text('${user.lastname} ${user.firstname}', style: TextStyle(color: Kara.background, fontSize: 16),),
          Text('${user.role}', style: TextStyle(color: Kara.background, fontSize: 16),),
        ],
      ),
    );
  }
}
