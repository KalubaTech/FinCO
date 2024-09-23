import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:finco/controllers/user_controller.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/anchor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../models/user_model.dart';

class JoiningLoader extends StatelessWidget {
  UserModel userModel;
  JoiningLoader({required this.userModel});

  @override
  Widget build(BuildContext context) {

    UserController _userController = Get.find();

    Timer(Duration(seconds: 5),(){
      _userController.user.value = userModel;
      _userController.update();
      Get.offAll(()=>PageAnchor(), transition: Transition.fade);
    });

    List<ImageProvider> images = [
      ExactAssetImage('assets/logo.png',scale: 1),
      FileImage(File(userModel.picture)),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeInDown(
              child: FlutterImageStack.providers(
                providers: images,
                showTotalCount: true,
                totalCount: 2,
                itemRadius: 100, // Radius of each images
                itemCount: images.length, // Maximum number of images to be shown in stack
                itemBorderWidth: 3,
                itemBorderColor: Kara.primary,// Border width around the images
                backgroundColor: Kara.primary2,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Text("WELCOME TO \n FINANCE COMPANION", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 40,),
          LoadingAnimationWidget.inkDrop(color: Kara.primary, size: 40)
        ],
      ),
    );
  }
}
