import 'package:finco/models/comment_model.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController{
  var comments = <CommentModel>[

  ].obs;

  List<CommentModel>filterCommentsByMessage(String msgid){
    List<CommentModel>comments_filtered = [];

    comments_filtered = comments.value.where((c)=>c.msgID==msgid).toList();
    print(comments);
    return comments_filtered;
  }
}