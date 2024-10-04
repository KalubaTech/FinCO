import 'package:finco/controllers/comments_controller.dart';
import 'package:finco/controllers/messages_controller.dart';
import 'package:finco/models/comment_model.dart';
import 'package:finco/models/message_model.dart';
import 'package:get/get.dart';

class Methods {

  MessagesController _messagesController = Get.find();
  CommentsController _commentsController = Get.find();

  void addPost(MessageModel message){
    _messagesController.messages.value.add(message);
    _messagesController.update();
  }

  void addComment(CommentModel comment){
    _commentsController.comments.value.add(comment);
    _commentsController.update();
  }

}