import 'dart:io';
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/function/uploadfile.dart';
import 'package:drive_testapp/Data/DataSource/remote/Cars/Cars_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoriesAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 CarsData carsData=CarsData(Get.find());
 File? file;
 late TextEditingController name;
 late TextEditingController make;
 late TextEditingController model;
 late TextEditingController color;
 late TextEditingController type;
 late TextEditingController year;
 late TextEditingController rengno;
 late TextEditingController pricerent;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 Uint8List? webimg;
///////////////
Future fileUploadGallery2()async{
  if(!kIsWeb){
    final ImagePicker picker=ImagePicker();
    XFile? image=await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      var selectedimag=File(image.path);
      file= selectedimag;
      update();
    }else{
      return "No image has been picked";
    }
  }else if(kIsWeb){
    final ImagePicker picker=ImagePicker();
    XFile? image=await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      var f= await image.readAsBytes();
      webimg=f;
      file=File(image.path);
      print(file);
      update();
      // 
    }else{
      return "No image has been picked";
    }
  }else{
    return "something went wrong";
  }
update();

}
////////////
 chooseImage()async{
  file=await fileUploadGallery();
  update();
 }

addData()async {
    if(formsate.currentState!.validate()){
      if(file==null)return Get.snackbar("Alert","Please choose Image");
      Map data={
      "name":name.text,
      "make":make.text,
      "model":model.text,
      "color":color.text, 
      "type":type.text,
      "year":year.text,
      "rengno":rengno.text,
      "price":pricerent.text,};
   statusRequest=StatusRequest.loading;
   update();
    var response=await carsData.addCarsData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offAllNamed(RoutesApp.home);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    name=TextEditingController();
    make=TextEditingController();
    model=TextEditingController();
    color=TextEditingController();
    type=TextEditingController();
    year=TextEditingController();
    rengno=TextEditingController();
    pricerent=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}