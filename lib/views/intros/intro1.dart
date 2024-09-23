import 'package:finco/components/gradient_button.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/intro1.png', fit: BoxFit.cover,width: double.infinity,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeIn(child: Text('Access Anywhere', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  FadeInDown(
                    child: Text(
                      'Anywhere Access is a next-generation finance solution that provides simple access.', 
                      style: TextStyle(
                          color: Kara.greyish),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40,),
                  GradientButton(
                      label: 'GET STARTED!',
                      colors: [Kara.primary,Kara.primary2],
                      height: 50,
                      onclick: (){
                        Get.to(()=>SignUp(), transition: Transition.fadeIn);
                      }
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
