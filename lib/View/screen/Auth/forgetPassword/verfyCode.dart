
import 'package:drive_testapp/Controller/Auth/verify_controller.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>VerificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Verification Code",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body: GetBuilder<VerificationControllerImp>(
        builder: (controller)=>Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child:  ListView(
                  children: [
                  
                   const CustumFormLable(label: "Check Code",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "Sign In with your Email and Password OR Continuoue with Social Media"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) {},
                      onSubmit: (String Verification) {
                        controller.goToResetPassword(Verification);
                      },
                    ),
                    const SizedBox(height: 30,),
                   
                    
                   
                  ],
                ),
        ),
      ),
      
    );
  }
}