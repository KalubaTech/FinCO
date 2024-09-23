import 'package:finco/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  var user = UserModel(
      uid: '',
      firstname: '',
      lastname: '',
      email: '',
      phone: '',
      picture: '',
      dateJoined: '',
      role: ''
  ).obs;
}