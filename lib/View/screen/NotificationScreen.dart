
import 'package:drive_testapp/Controller/notification_controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: GetBuilder<NotificationController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
            children: [
              const Center(child: Text("From Drive Test Application",style: TextStyle(color: Appcolors.primarycolor,
              fontSize: 18,fontWeight: FontWeight.bold),
              ),
              ),
              const SizedBox(height: 15,),
              ...List.generate(controller.data.length,
               (index) => Stack(
                children: [
                  ListTile(
                    title: Text(controller.data[index]["notification_title"]),
                    subtitle:Text (controller.data[index]["notification_body"]), 
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Text(Jiffy.parse(controller.data[index]["notification_date"]).fromNow(),
                         style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),
                          ) ,)
                ],
              ))
            ],
          ),),
        );
      }
    ),
    );
  }
}