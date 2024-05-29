
import 'package:drive_testapp/Controller/Cars/edit_controller.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/function/validator.dart';
import 'package:drive_testapp/Core/shared/CustomFormglobal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsEditScreen extends StatelessWidget {
  const CarsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   CarsEditController controller=Get.put(CarsEditController());
    return Scaffold(
      appBar: AppBar(title: const Text("Cars Edit")),
      body: GetBuilder<CarsEditController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: [
               Form(
                key: controller.formsate,
                child: Column(children: [
                CustumFormGlobal(
                label: "Cars name",
                 hinttext: "Ensert car name",
                  icon: Icons.car_rental, 
                  mycontroller: controller.name, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
          
               CustumFormGlobal(
                label: "car Make",
                 hinttext: "Ensert car Make",
                  icon: Icons.factory, 
                  mycontroller: controller.make, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),

            CustumFormGlobal(
                label: "car model",
                 hinttext: "Ensert car model",
                  icon: Icons.model_training, 
                  mycontroller: controller.model, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),

            CustumFormGlobal(
                label: "car color",
                 hinttext: "Ensert car color",
                  icon: Icons.color_lens, 
                  mycontroller: controller.color, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),

           CustumFormGlobal(
                label: "car type",
                 hinttext: "Ensert car type",
                  icon: Icons.type_specimen, 
                  mycontroller: controller.type, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),

            CustumFormGlobal(
                label: "year",
                 hinttext: "Ensert car year",
                  icon: Icons.date_range, 
                  mycontroller: controller.year, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "number");
                  }, isNumber: true),
             CustumFormGlobal(
                label: "car RengNo",
                 hinttext: "Ensert car RengNo",
                  icon: Icons.receipt_long_rounded, 
                  mycontroller: controller.rengno, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
              CustumFormGlobal(
                label: "car Price",
                 hinttext: "Ensert car Rent Price",
                  icon: Icons.price_change, 
                  mycontroller: controller.pricerent, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "number");
                  }, isNumber: true),
          
                    
               ],)),
                //  if(controller.bytesdata !=null)
                //      Image.memory(controller.bytesdata!,width: 70,height: 70,),
                  if(controller.file !=null)
                    kIsWeb?Image.memory(controller.webimg,width: 70,height: 70,)
                    :Image.file(controller.file!,width: 70,height: 70,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 50),
                   child: MaterialButton(
                        
                        color: Appcolors.thirdcolor,
                        onPressed: (){
                          // controller.webfilepicker();
                          controller.fileUploadGallery2();
                        },child: const Text("Choose Category Image"),),
                 ),
          
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.primarycolor,
                    foregroundColor: Colors.white),
                  onPressed: (){
                    controller.editData();
                  }, child: const Text("Edit"))
                  
          
            ],),
          );
        }
      ),
    );
  }
}