
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/payment_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

   

   TextEditingController? accountNo;
   TextEditingController? totalmony;
   TextEditingController? nameoncard;

   StatusRequest statusRequest=StatusRequest.None;
   PaymentData paymentData=PaymentData(Get.find());
   MyServices myServices=Get.find();

   GlobalKey<FormState> formstate=GlobalKey<FormState>();


   initialData(){
    accountNo=TextEditingController();
    totalmony=TextEditingController();
    nameoncard=TextEditingController();
    
   }

addpaymentData()async{
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await paymentData.addpayment(
       myServices.sharedPref.getString("Id")!,
      accountNo!.text,
      nameoncard!.text,
      totalmony!.text

    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         Get.offAllNamed(RoutesApp.succesrent);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    
    update();
     }
   }


      @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    accountNo?.dispose();
    totalmony?.dispose();
    nameoncard?.dispose();
    super.dispose();
  }

}