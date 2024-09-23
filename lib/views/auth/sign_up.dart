import 'dart:io';

import 'package:dropdown_plus_plus/dropdown_plus_plus.dart';
import 'package:finco/components/gradient_button.dart';
import 'package:finco/components/kalutext.dart';
import 'package:finco/models/user_model.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/intros/joining_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String role = '';

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Kara.primary,
        foregroundColor: Kara.background,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 40,),
            Container(
              child: Center(
                child: ImagePickerWidget(
                  diameter: 120,
                  initialImage: "https://st3.depositphotos.com/3431221/13621/v/450/depositphotos_136216036-stock-illustration-man-avatar-icon-hipster-character.jpg",
                  shape: ImagePickerWidgetShape.circle, // ImagePickerWidgetShape.square
                  isEditable: true,
                  shouldCrop: true,
                  onChange: (File file) {
                     image = file;
                  },
                ),
              ),
            ),
            SizedBox(height: 40,),
            Kalutext(
                controller: _firstNameController,
                hintText: 'First Name',
            ),
            SizedBox(height: 20,),
            Kalutext(
                controller: _lastNameController,
                hintText: 'Last Name',
            ),
            SizedBox(height: 20,),
            Kalutext(
                controller: _emailController,
                hintText: 'Email Address',
            ),
            SizedBox(height: 20,),
            Kalutext(
                controller: _phoneController,
                hintText: 'Phone Number',
                isNumber: true,
            ),
            SizedBox(height: 20,),
            TextDropdownFormField(
              options: ["Investor", "Dealer", "Trader", "Other"],
              decoration: InputDecoration(
                 fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100, width: 0.5),
                    gapPadding: 4,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusColor: Kara.primary,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                  focusedBorder:   OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    gapPadding: 4,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    gapPadding: 4,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Occupation / Role"),
              cursorColor: Colors.green,
              dropdownItemColor: Colors.black,
              onChanged: (String value){
                role = value;
                print(role);
              },
            ),
            SizedBox(height: 40,),
            GradientButton(
                label: 'DONE',
                colors: [Kara.primary, Kara.primary2],
                onclick: (){
                  UserModel user = UserModel(
                      uid: '',
                      firstname: _firstNameController.text,
                      lastname: _lastNameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      picture: image!.path,
                      dateJoined: '${DateTime.now()}',
                      role: role
                  );

                  Get.to(()=>JoiningLoader(userModel: user), transition: Transition.fadeIn);
                }
            )
          ],
        ),
      ),
    );
  }
}
