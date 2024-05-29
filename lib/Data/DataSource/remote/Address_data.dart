 

import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/linkAPI.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(String name,String userid,String city,String street,double lat,double long)async{
    
     var response=await crud.postData(AppLinks.addAddress, {
           "name":name.toString(),
           "userId":userid.toString(),
           "city":city.toString(),
           "street":street.toString(),
           "lat":lat.toString(),
           "long":long.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

  getAddress(String userid)async{
     var response=await crud.postData(AppLinks.viewAddress, {
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

  deletAddress(String addressid)async{
     var response=await crud.postData(AppLinks.deleteAddress, {
      "addressid":addressid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String name,String userid,String city,String street,double lat,double long)async{
     var response=await crud.postData(AppLinks.editAddress, {
          "name":name.toString(),
           "userId":userid.toString(),
           "city":city.toString(),
           "street":street.toString(),
           "lat":lat.toString(),
           "long":long.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }
 }