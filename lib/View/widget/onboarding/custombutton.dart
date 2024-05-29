
import 'package:drive_testapp/Controller/onboarding_controller.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<OnBoardingControllerImpllement> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child:MaterialButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      onPressed: (){
                        controller.next();
                      },
                      color: Appcolors.primarycolor,
                      child: const Text("Continou"),
                      ) ,
                  );
  }
}