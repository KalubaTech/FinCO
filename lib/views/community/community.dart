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
        hasImage: true,
        threadId: '3323',
        datetime: '${DateTime.now()}'
    ),
    MessageModel(
        uid: '2',
        body: 'Hello fellow Investors!',
        sender: UserModel(
            uid: '2334',
            firstname: 'Mulenga',
            lastname: 'Chakanga',
            email: '',
            phone: '',
            picture: '',
            dateJoined: '${DateTime.now().add(Duration(days: 60))}',
            role: 'Dealer'
        ),
        hasImage: false,
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
                          Icon(Icons.send, color: Kara.primary,),
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
