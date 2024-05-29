
import 'package:drive_testapp/View/screen/Cars/CarsViewScreen.dart';
import 'package:drive_testapp/View/screen/NotificationScreen.dart';
import 'package:drive_testapp/View/screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
 int currentpage=0;
 List<Widget> listPages=[
  const  CarsViewScreen(),
  const NotificationScreen(),
  const ProfileScreen(),
  
  // OffersViewScreen(),

//  SettingsScreen(),

  // NotificationScreen(),

 ];

 List Bottomappbar=[
 { "title":"Home","icon":Icons.home},
  {"title":"Notification","icon":Icons.notifications},
   { "title":"Profile","icon":Icons.person},
 ];

  
ChangePage(int i) {
    currentpage=i;
    update();
  }
  
 
}



