import 'package:finco/models/message_model.dart';
import 'package:finco/models/user_model.dart';
import 'package:get/get.dart';


class MessagesController extends GetxController{
  var messages = MessageModel(
      uid:'',
      body: '',
      sender: UserModel(
          uid: '',
          firstname: '',
          lastname: '',
          email:'',
          phone: '',
          picture:'',
          dateJoined: '',
          role: ''
      ),
      threadId: '',
      datetime: ''
  ).obs;
}