
import 'package:finco/components/activity_item.dart';
import 'package:finco/components/dashboard_header.dart';
import 'package:finco/components/stock_pick_item.dart';
import 'package:finco/utils/colors.dart';
import 'package:finco/views/webview/luse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DashboardHeader(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Row(
                      children: [
                        InkWell(
                            child: Row(
                              children: [
                                Image.asset('assets/luselogo.webp', width: 30,),
                                SizedBox(width: 10,),
                                Text('LuSE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                              ],
                            ),
                          onTap: (){
                              Get.to(()=>LuseView(), transition: Transition.fadeIn);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(child: StockPickItem(figure: '394', period: 'Monthly', colors: [Kara.primary, Kara.primary2])),
                        SizedBox(width: 20,),
                        Expanded(child: StockPickItem(figure: '204', period: 'Weekly', colors: [Kara.secondary, Kara.secondary2]),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ...
                            List.generate(10, (i){
                              return ActivityItem(
                                  barColor: Kara.primary,
                                  title: 'Marketing Trending',
                                  subtitle: 'From last year',
                                  trailing: Text('K26', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              );
                            })
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
