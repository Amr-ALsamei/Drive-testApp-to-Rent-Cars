import 'package:drive_testapp/Core/Localization/changelocal.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/View/widget/ButtonLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedAppScreen extends GetView<LocalController> {
  const GetStartedAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Color.fromARGB(255, 126, 111, 170),
             BlendMode.modulate),
            child: Image.asset("assets/images/start.jpg",fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
            ),
          ),
          const Center(
            child: Text("The Drive Test Application was designed to help people to rental cars online from anywhere. click on Get Started to know more about the application. ",
             textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 25,color: Colors.white),
                 ),
          ),
               
                
                 Positioned(
                  bottom: 40,
                  right: 60,
                   child: ButtonLanguage(textbutton: "GETSTARTED", onPressed: (){
                    controller.changeLang("en");
                    Get.toNamed(RoutesApp.onbordingRoute);
                   }),
                 ),
          
        ],
      ) ,
    );
  }
}