import 'package:finco/components/community/message_bubble.dart';
import 'package:finco/models/user_model.dart';
import 'package:finco/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../models/message_model.dart';

class Community extends StatelessWidget {
  Community({super.key});

  List<MessageModel>_messages=[
    MessageModel(
        uid: '1',
        body: 'Hello fellow dealers!',
        sender: UserModel(
            uid: '23434',
            firstname: 'Kaluba',
            lastname: 'Chakanga',
            email: '',
            phone: '',
            picture: '',
            dateJoined: '${DateTime.now().add(Duration(days: 60))}',
            role: 'Investor'
        ),
        threadId: '3323',
        datetime: '${DateTime.now()}'
    ),
  ];

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
                child: Container(
                  child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (c,i){
                        MessageModel message = _messages[i];
                        return MessageBubble(message: message);
                      }),
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions, color: Kara.greyish,),
                    SizedBox(width: 6,),
                    Expanded(child: Text('Type message...')),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.image_sharp, color: Kara.greyish,),
                          SizedBox(width: 5,),
                          Icon(Icons.add, color: Kara.greyish,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
