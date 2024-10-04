import 'package:flutter/material.dart';

import '../../models/comment_model.dart';

class CommentBubble extends StatelessWidget {
  CommentModel comment;
  CommentBubble({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 10,),
          CircleAvatar(
            radius: 8,
          ),
          SizedBox(width: 10,),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Text('${comment.comment}'),
              )
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
