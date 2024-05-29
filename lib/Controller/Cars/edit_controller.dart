
import 'dart:io';
import 'package:drive_testapp/Controller/Cars/view_controller.dart';
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/function/uploadfile.dart';
import 'package:drive_testapp/Data/DataSource/remote/Cars/Cars_data.dart';
import 'package:drive_testapp/Data/Model/carsModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class CarsEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 CarsData carsData=CarsData(Get.find());
 File? file;
 Uint8List webimg=Uint8List(8);
 late TextEditingController name;
 late TextEditingController make;
 late TextEditingController model;
 late TextEditingController color;
 late TextEditingController type;
 late TextEditingController year;
 late TextEditingController rengno;
 late TextEditingController pricerent;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? carid;
 String? img;

 CarsModel? carsModel;
 List<int>?  selectedfile;
 Uint8List? bytesdata;
//////////////////////
// webfilepicker()async{
//   html.FileUploadInputElement uploadimg=html.FileUploadInputElement();
//   uploadimg.multiple=true;
//   uploadimg.draggable=true;
//   uploadimg.click();

//   uploadimg.onChange.listen((event) {
//    final files=uploadimg.files ;
//    final fil=files![0];
//    final reader=html.FileReader();
//    reader.onLoadEnd.listen((event) { 
//     bytesdata=Base64Decoder().convert(reader.result.toString().split(".").last);
//     selectedfile=bytesdata ;
//     update();

//    });
//    reader.readAsArrayBuffer(fil);
   
//    });
   

// }
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
      // base64Encode(await File(_selectedImagePath).readAsBytes());
      file=File(image.path);
      print("the files is $file");
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
/////////////////////
chooseImage()async{
  file=await fileUploadGallery();
  update();
 }

editData()async {
    if(formsate.currentState!.validate()){
      // if(file==null)return Get.snackbar("Alert","Please choose Image SVG");
      Map data={
      "carid":carid,
      "name":name.text,
      "make":make.text,
      "model":model.text,
      "color":color.text, 
      "type":type.text,
      "year":year.text,
      "rengno":rengno.text,
      "price":pricerent.text,
      "imagold":img};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await carsData.editCarsData(data,file);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offNamed(RoutesApp.home);
      CarsViewController c=Get.find();
      c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    carsModel=Get.arguments["carsModel"];
    name=TextEditingController();
    make=TextEditingController();
    model=TextEditingController();
    color=TextEditingController();
    type=TextEditingController();
    year=TextEditingController();
    rengno=TextEditingController();
    pricerent=TextEditingController();
    //////////////////////////////
    name.text=carsModel!.carName!;
    make.text=carsModel!.carMake!;
    model.text=carsModel!.carModel!;
    color.text=carsModel!.carColor!;
    type.text=carsModel!.carType!;
    year.text="${carsModel!.carYear!}";
    rengno.text=carsModel!.carRegNo!;
    pricerent.text="${carsModel!.carPricePerday!}";
    carid=carsModel!.carId.toString();
    img=carsModel!.carImage;
    // TODO: implement onInit
    super.onInit();
  }
}