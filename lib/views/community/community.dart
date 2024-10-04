import 'package:finco/components/community/message_bubble.dart';
import 'package:finco/controllers/comments_controller.dart';
import 'package:finco/controllers/messages_controller.dart';
import 'package:finco/controllers/user_controller.dart';
import 'package:finco/helpers/methods.dart';
import 'package:finco/models/comment_model.dart';
import 'package:finco/models/user_model.dart';
import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/message_model.dart';

class Community extends StatelessWidget {
  Community({super.key});

  TextEditingController _messageController = TextEditingController();

  UserController _userController = Get.find();

  Methods _methods = Methods();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kara.primary,
        foregroundColor: Colors.white,
        title: Text('Community'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: GetBuilder<MessagesController>(
                  builder: (messagesController) {

                    return Container(
                      child: ListView.builder(
                          itemCount: messagesController.messages.value.length,
                          itemBuilder: (c,i){
                            MessageModel message = messagesController.messages.value[i];
                            return MessageBubble(message: message);
                          }),
                    );
                  }
                )
            ),
            Divider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions, color: Kara.secondary2,),
                    SizedBox(width: 6,),
                    Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            border: InputBorder.none,
                            hintText: 'Type message...'
                          ),
                        )
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.image_sharp, color: Kara.secondary2,),
                          SizedBox(width: 10,),
                          InkWell(
                             onTap: (){
                               if(_messageController.text.isNotEmpty){
                                 MessageModel _message = MessageModel(
                                     uid: '3',
                                     body: _messageController.text,
                                     hasImage: false,
                                     sender: _userController.user.value,
                                     threadId: '12222',
                                     datetime: '${DateTime.now}');
                                 _methods.addPost(_message);
                                 _messageController.clear();
                               }

                             },
                              child: Icon(Icons.send, color: Kara.primary,)
                          ),
                        ],
                      ),
                    )
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
