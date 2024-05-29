
import 'package:drive_testapp/Controller/Auth/forgetpasswordController.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/function/validator.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformText.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformfield.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Forget Password",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller)=>Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child:  ListView(
                  children: [
                   const LogoAuth(),
                   const CustumFormLable(label: "Check Email",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "Enter your Email to ensure you account with verfiycode and Reset the Password"),
        
                  const SizedBox(height: 30,),
                    Form(
                      key:controller.formstateforgetpassword ,
                      child: Column(
                      children: [
                        CustumFormField(
                          isNumber: false,
                          valid: (val) {
                          return  ValidInput(val!, 5, 100, "email");
                          },
                          label:"Email" ,hinttext: "Enter Your Email",
                        icon: Icons.email_outlined,
                        mycontroller: controller.email),
                        const SizedBox(height: 25,),
                        
                        
                      ],
              
                    ) ),
                    const SizedBox(height: 30,),
                   
                    CustumButtonAuth(text: "Check",onPressed: () {
                       controller.CheckEmail();
                    },),
                   
                  ],
                ),
        ),
      ),
      
    );
  }
}