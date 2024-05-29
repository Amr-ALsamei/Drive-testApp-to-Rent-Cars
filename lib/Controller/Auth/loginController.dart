
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/Auth/logInData.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController{
  login();
 
  goToForgetPassword();
}

class LogInControllerImp extends LogInController{

 GlobalKey<FormState> formstatelog=GlobalKey<FormState>();

 late TextEditingController email;
 late TextEditingController password;

  bool isShowPassword=false;

  StatusRequest statusRequest=StatusRequest.None;
  LogInData logInData=LogInData(Get.find());

  MyServices myServices=Get.find();

  ShowPassword(){
    isShowPassword=isShowPassword==true?false:true;
    update();

  }

  @override
  login()async {
    if(formstatelog.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await logInData.LogInPostData(email.text,password.text);
    print(response);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       if(response['data']['user_aproov']==1){
        myServices.sharedPref.setInt("type", response['data']['user_type']);
         myServices.sharedPref.setString("Id", response['data']['user_id'].toString());
         // ignore: unused_local_variable
         String userid=myServices.sharedPref.getString("Id")!;
        myServices.sharedPref.setString("username",response['data']['user_name'] );
        myServices.sharedPref.setString("email",response['data']['user_email'] );
        myServices.sharedPref.setString("phone",response['data']['user_phone'].toString() );
        myServices.sharedPref.setString("step","2" );
        Get.offNamed(RoutesApp.home);
       }else{
        Get.toNamed(RoutesApp.verfyCodeSignUp,arguments: {
               "email":email.text  }); }
      // Get.delete<SignUpControllerImp>();
        }else{ Get.defaultDialog(title: "Wraning", middleText: "Password or email not correct");
          statusRequest=StatusRequest.failure; }}
    update(); }}
  
 goToSignUp() {
    Get.offNamed(RoutesApp.signup);
  } 

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value){
    //     print(value);
    //     // ignore: unused_local_variable
    //     String? token=value;
    // });
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  goToForgetPassword() {
   Get.toNamed(RoutesApp.forgetpassword);
  }

}