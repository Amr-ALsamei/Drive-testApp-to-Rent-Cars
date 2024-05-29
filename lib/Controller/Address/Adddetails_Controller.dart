
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/Address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController{

   double? lat;
   double? long;

   TextEditingController? name;
   TextEditingController? city;
   TextEditingController? street;

   StatusRequest statusRequest=StatusRequest.None;
   AddressData addressData=AddressData(Get.find());
   MyServices myServices=Get.find();

   GlobalKey<FormState> formstate=GlobalKey<FormState>();


   initialData(){
    name=TextEditingController();
    city=TextEditingController();
    street=TextEditingController();
    lat=Get.arguments['lat'];
    long=Get.arguments['long'];
    print(lat);
    print(long);
   }

addAddressData()async{
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await addressData.addAddress(
      name!.text,
      myServices.sharedPref.getString("Id")!,
      city!.text,
      street!.text,
      lat!,long!

    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         Get.toNamed(RoutesApp.paymentpage);
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
    name?.dispose();
    city?.dispose();
    street?.dispose();
    super.dispose();
  }

}