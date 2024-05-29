
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/Favorites_data.dart';
import 'package:drive_testapp/Data/Model/favoriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController{


 StatusRequest statusRequest=StatusRequest.None;
 FavoritesdData favoritesdData=FavoritesdData(Get.find());
 MyServices myServices=Get.find();
 List<FavoriteModel> favoritelist=[];

 TextEditingController? searchcar;
 bool isSearch=false;

checkSearch(val){
  if(val==""){
    statusRequest=StatusRequest.None;
    isSearch=false;
    getFavoriteCarData();
  }
  update();
 }

 onSearchcar(){
  isSearch=true;
  searchFavoriteCarData();
  update();
 }

 searchFavoriteCarData()async {
   statusRequest=StatusRequest.loading;
   update();
    var response=await favoritesdData.searchFavoriteData(searchcar!.text,myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      favoritelist.clear();
      List responsedata=response['data'];
      favoritelist.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

getFavoriteCarData()async {
  favoritelist.clear();
   statusRequest=StatusRequest.loading;
   update();
    var response=await favoritesdData.viewFavoriteData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsedata=response['data'];
      favoritelist.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
/////////////////////////////////
Map FavoriteMap={

};

changeFavoriValue(id,val){
  FavoriteMap[id]=val;
  update();

}
//////////////
onclickonFavorite(int carid){
   favoritelist.removeWhere((element) => element.carId==carid);
   changeFavoriValue(carid,0);
   PostFavoritesData(carid,0);
   update();
}
///////////////////
PostFavoritesData(int carid,int favoritevalue)async {
   
  statusRequest=StatusRequest.loading;
   update();
    var response=await favoritesdData.PostData(myServices.sharedPref.getString("Id")!,
    carid.toString(),favoritevalue.toString());
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
     getFavoriteCarData();
    //  CarsViewController c=Get.find();
    //   c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    
  }
  @override
  void onInit() {
    getFavoriteCarData();
    searchcar=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
  

}