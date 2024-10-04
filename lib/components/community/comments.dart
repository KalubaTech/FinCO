import 'package:finco/components/community/comment_bubble.dart';
import 'package:finco/controllers/comments_controller.dart';
import 'package:finco/helpers/methods.dart';
import 'package:finco/models/comment_model.dart';

import '../../models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';


class Comments extends StatelessWidget {
  MessageModel message;
  Comments({required this.message});

  TextEditingController _commentController = TextEditingController();

  Methods _methods = Methods();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CommentsController>(
      builder: (commentsController) {
        List<CommentModel> postComments = commentsController.filterCommentsByMessage(message.uid);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: postComments.length,
                          itemBuilder: (c,i){
                            CommentModel comment =  postComments[i];
                            return CommentBubble(comment: comment);
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
                              controller: _commentController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                                  border: InputBorder.none,
                                  hintText: 'Comment as Kaluba'
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
                                  if(_commentController.text.isNotEmpty){
                                    CommentModel comment = CommentModel(comment: _commentController.text, msgID: '${message.uid}');
                                    _methods.addComment(comment);
                                    _commentController.clear();
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
            )
          ),
        );
      }
    );
  }
}
