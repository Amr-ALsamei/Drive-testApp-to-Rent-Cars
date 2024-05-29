
import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/linkAPI.dart';
class LogInData {
  Crud crud;
  LogInData(this.crud);

  LogInPostData(String emal,String password)async{
     var response=await crud.postData(AppLinks.login, {
      "email":emal,
      "password":password,
     });
    return response.fold((l) => l, (r) => r);
  }
 }