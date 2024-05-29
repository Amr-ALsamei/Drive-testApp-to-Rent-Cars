 

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/linkAPI.dart';
class CarsData {
  Crud crud;
  CarsData(this.crud);

getCarsData(String userid)async{
     var response=await crud.postData(AppLinks.carsview, {
      "userId":userid.toString()
       });
    return response.fold((l) => l, (r) => r);
  }

  searchData(String itemname)async{
     var response=await crud.postData(AppLinks.searchcar, {
      "carName":itemname
     });
    return response.fold((l) => l, (r) => r);
  }

// addCarsData(Map data,File file)async{
//      var response=await crud.addRequestWithImageOne(AppLinks.carsadd, data,file);
//     return response.fold((l) => l, (r) => r);
//   }
addCarsData(Map data,File file)async{
     var response=await crud.postData(AppLinks.carsadd, data);
    return response.fold((l) => l, (r) => r);
  }

editCarsData(Map data,[File? file])async{
     Either<StatusRequest, Map> response;
     if(file==null){
         response=await crud.postData(AppLinks.carsedit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.carsedit, data,file);
     }
    return response.fold((l) => l, (r) => r);
  }

deleteCarsData(Map data)async{
     var response=await crud.postData(AppLinks.carsdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  
 }
