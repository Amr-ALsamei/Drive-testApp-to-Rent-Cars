
import 'package:drive_testapp/Controller/Auth/verify_controller_SignUp.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VerificationCodeSignUp extends StatelessWidget {
  const VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>VerificationControllerSignUpImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Verification Code",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body:GetBuilder<VerificationControllerSignUpImp>(
        builder: (controller)=> Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                  
                   const CustumFormLable(label: "Check Code",),
        
                   const SizedBox(height: 10,),
                   CustumFormText(text: "Please Enter The Digit Code Sent To ${controller.email}"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) {},
                      onSubmit: (String VerificationCode) {
                        controller.goToSuccessSignUp(VerificationCode);
                      },
                    ),
                    const SizedBox(height: 30,),
                   InkWell(onTap: () {
                       controller.Resend();
                   },
                   child: const Center(child:Text("Resend verfiy code",style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,),)
                    
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}