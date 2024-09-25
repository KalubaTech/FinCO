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
        decoration: BoxDecoration(
          color: Kara.background,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: Kara.greyish
            )
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: FileImage(File(user.picture)),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user.firstname} ${user.lastname}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                        Text('Investor', style: TextStyle(fontSize: 12,),)
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.more_vert_rounded)
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Kara.greyish,
              height: 1,
            ),
            message.hasImage?Container(
              child: Image.asset('assets/image_office.jpg'),
            ):
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${message.body}'*10)
                ],
              ),
            ),
            Container(
              color: Kara.greyish,
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.thumb_up_alt_sharp, size: 16,),
                  SizedBox(width: 20,),
                  Icon(Icons.thumb_down, size: 16,),
                  Spacer(),
                  Text('294  ', style: TextStyle(fontSize: 12),),
                  Icon(Icons.comment, size: 16,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
