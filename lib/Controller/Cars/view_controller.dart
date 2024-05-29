
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/Cars/Cars_data.dart';
import 'package:drive_testapp/Data/Model/carsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsViewController extends GetxController{

 List<CarsModel> carsdata=[];
 StatusRequest statusRequest=StatusRequest.None;
 CarsData carsData=CarsData(Get.find());
 MyServices myServices=Get.find();
TextEditingController? searchcar;
 bool isSearch=false;
checkSearch(val){
  if(val==""){
    statusRequest=StatusRequest.None;
    isSearch=false;
    getData();
    
  }
  update();
 }

 onSearchcar(){
  isSearch=true;
  searchCarData();
  update();
 }

 searchCarData()async {
   statusRequest=StatusRequest.loading;
   update();
    var response=await carsData.searchData(searchcar!.text);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      carsdata.clear();
      List responsedata=response['data'];
        carsdata.addAll(responsedata.map((e) => CarsModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

getData()async {
  carsdata.clear();
   statusRequest=StatusRequest.loading;
   update();
    var response=await carsData.getCarsData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsdata=response['data'];
      carsdata.addAll(responsdata.map((e) => CarsModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
deletCars(String catid,String imagname){
    carsData.deleteCarsData({
           "carId":catid.toString(),
           "imagename":imagname.toString(),
    });
   
   
   carsdata.removeWhere((element) => element.carId.toString()==catid);
   Get.offAllNamed(RoutesApp.home);
    update();

  }
goToEditPage(CarsModel categoriesModel){
  //  Get.toNamed(RoutesApp.categoriesedit,arguments:{
  //   "categoriesModel":categoriesModel
  //  } );
}

goToCarDetails(List<CarsModel> carsModel,int i){
 
  print(i);
   Get.toNamed(RoutesApp.carsdetails,arguments: {
    "carDetails":carsModel,
    "index":i
              });
}
  @override
  void onInit() {
      getData();
   searchcar=TextEditingController();
    
    // TODO: implement onInit
    super.onInit();
  }

 onMakeBack(){
  Get.offAllNamed(RoutesApp.home);
  return Future.value(false);
 } 
}