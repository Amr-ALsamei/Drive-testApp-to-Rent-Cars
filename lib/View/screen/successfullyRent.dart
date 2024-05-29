
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessedRentCar extends StatelessWidget {
  
  const SuccessedRentCar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:Text( "Successed Payment",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      backgroundColor: Appcolors.background,
      body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,size: 200,color: Appcolors.primarycolor,),
              const CustumFormText(text:"Thanks for finished Steps to Rent Your Ideal Car SuccessFully"),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: CustumButtonAuth(text: "Go To Home",onPressed: () {
                      Get.offAllNamed(RoutesApp.home);
                    },),
              ),
             
            ],
          ),
        )
      
    );
  }
}