
import 'package:drive_testapp/Controller/Address/Adddetails_Controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/function/validator.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:drive_testapp/View/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(AddressDetailsController());
    return Scaffold(
      // appBar: AppBar(title: Text("Add Address Details"),),
     
      body: GetBuilder<AddressDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const Center(child:Text("Complete Location Info",style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,),
                  Form(
                    key: controller.formstate,
                    child: Column(
                    children: [
                      CustumFormField(
                    label: "City", 
                    hinttext: "City", icon: Icons.location_city,
                     mycontroller: controller.city!, 
                     valid: (val){
                      return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                     CustumFormField(
                    label: "Street", 
                    hinttext: "Street", icon: Icons.streetview,
                     mycontroller: controller.street!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                     CustumFormField(
                    label: "Name", 
                    hinttext: "Name", icon: Icons.near_me,
                     mycontroller: controller.name!, 
                     valid: (val){
                     return ValidInput(val!, 2, 100, "username");
                     }, 
                     isNumber: false
                     ),
                    ],
                   )),
                   const SizedBox(height: 50,),
          
                     CustumButtonAuth(
                      text: "Continueu",
                      onPressed: () {
                       controller.addAddressData();
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