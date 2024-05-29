
import 'package:drive_testapp/Controller/onboarding_controller.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/View/widget/onboarding/custombutton.dart';
import 'package:drive_testapp/View/widget/onboarding/customslider.dart';
import 'package:drive_testapp/View/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpllement());
                                          
    return  const Scaffold(
      backgroundColor:Appcolors.background ,
      body: SafeArea(
        child: Column( 
          children: [
            Expanded(
              flex: 4,
              child:CustomSliderOnBoarding() ,
            ),
           Expanded(
              flex: 1, 
              child: Column(
                children: [ 
                  CustomDotController(),
                  Spacer(flex: 2,),
                  CustomButton(),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}