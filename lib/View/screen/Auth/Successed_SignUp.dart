
import 'package:drive_testapp/Controller/Auth/successed_SignUpController.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessedSignUp extends StatelessWidget {
  
  const SuccessedSignUp({super.key});
 
  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>SuccessedSignUpControllerImp());
    return Scaffold(
      appBar:  AppBar(
        title:Text( "Successed SignUp",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      backgroundColor: Appcolors.background,
      body:GetBuilder<SuccessedSignUpControllerImp>
      (builder: (controller)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,size: 200,color: Appcolors.primarycolor,),
              const CustumFormText(text:"Thanks for finished SigningUp SuccessFully"),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: CustumButtonAuth(text: "Go To LogIn",onPressed: () {
                      controller.goToLogin();
                    },),
              ),
             
            ],
          ),
        ) ,)
      
    );
  }
}