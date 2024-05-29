
import 'package:drive_testapp/Controller/payment_controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/function/validator.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformfield.dart';
import 'package:drive_testapp/View/widget/paymentlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(PaymentController());
    return Scaffold(
      // appBar: AppBar(title: Text("Add Address Details"),),
     
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const LogoPayment(),
                  const Center(child:Text("Set Payment Info",style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,),
                  Form(
                    key: controller.formstate,
                    child: Column(
                    children: [
                      CustumFormField(
                    label: "Account Number", 
                    hinttext: "Set Account number with 8 numbers", icon: Icons.account_balance,
                     mycontroller: controller.accountNo!, 
                     valid: (val){
                      return ValidInput(val!, 8, 100, "number");
                     }, 
                     isNumber: true
                     ),
                     CustumFormField(
                    label: "CVV", 
                    hinttext: "Set payment Amount", icon: Icons.monetization_on,
                     mycontroller: controller.totalmony!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "number");
                     }, 
                     isNumber: true
                     ),
                     CustumFormField(
                    label: "First Name", 
                    hinttext: "Set Payment Name on card", icon: Icons.payment,
                     mycontroller: controller.nameoncard!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                    ],
                   )),
                   const SizedBox(height: 15,),
          
                     CustumButtonAuth(
                      text: "Continueu",
                      onPressed: () {
                       controller.addpaymentData();
                     },)
                ],
              ),
            ),
          );
        }
      )
    );
  }
}