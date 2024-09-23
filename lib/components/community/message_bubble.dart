import 'dart:io';

import 'package:finco/controllers/user_controller.dart';
import 'package:finco/models/user_model.dart';
import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  MessageModel message;
  MessageBubble({required this.message});
  
  UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {

    UserModel user = _userController.user.value;
    return Dismissible(
      key: Key('${message.uid}'),
      onDismissed: (d){

      },
      confirmDismiss: (e)async=>false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: FileImage(File(user.picture)),
              
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Kara.greyish),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${message.body}'*10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
