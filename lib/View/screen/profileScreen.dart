
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/constant/imageAssest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15,left: 5,right: 5),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Appcolors.thirdcolor,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Positioned(
              bottom: -20,
              right: 150,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(image:AssetImage(AppImageAssets.avatar,),),
                  borderRadius: BorderRadius.circular(100),
                  color: Appcolors.primarycolor
                ),)
                ),
                
          ],
        ),
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
                  children: [
                    Card(
                      child: ListTile(
                          title: const Text("Address",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          trailing: const Icon(Icons.maps_home_work),
                          onTap: (){
                            Get.toNamed(RoutesApp.addressviewpage);
                          },
                        ),
                    ),
                    Card(
                      child: ListTile(
                          title: const Text("LogOut",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          trailing: const Icon(Icons.logout),
                          onTap: (){
                            Get.defaultDialog(title: "Alert",
                            middleText: "Are you sure to exit from Application",
                            onCancel:() {},onConfirm: (){
                              Get.offAllNamed(RoutesApp.login);
                            });
                          },
                        ),
                    ),
                    Card(
                      child: ListTile(
                          title: const Text("Contact",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          trailing: const Icon(Icons.contact_emergency),
                          onTap: (){
                            
                          },
                        ),
                    )
                    ],
                  ),
        )
      ],
      );
  }
}