import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/community/community.dart';
import 'package:finco/views/dashboard/dashboard.dart';
import 'package:finco/views/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PageAnchor extends StatefulWidget {
  const PageAnchor({super.key});

  @override
  State<PageAnchor> createState() => _PageAnchorState();
}

class _PageAnchorState extends State<PageAnchor> {

  int _bottomNavIndex = 0;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Kara.primary,
        child: Icon(Icons.chat, color: Colors.white,),
        onPressed: () {
          Get.to(()=>Community(), transition: Transition.fadeIn);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.dashboard, Icons.notifications],
        activeIndex: _bottomNavIndex,
        activeColor: Kara.primary,
        inactiveColor: Kara.greyish,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          _pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
        }),
        //other params
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page){
          setState(() {
            _bottomNavIndex = page;
          });
        },
        children: [
          Dashboard(),
          Notifications(),
        ],
      ),
    );
  }
}
