import 'package:finco/models/user_model.dart';

class MessageModel{
  String uid;
  String body;
  UserModel sender;
  String threadId;
  String datetime;

  MessageModel({
    required this.uid,
    required this.body,
    required this.sender,
    required this.threadId,
    required this.datetime
  });
}