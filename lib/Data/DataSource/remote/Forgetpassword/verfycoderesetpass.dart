
import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/linkAPI.dart';

class VeryfyCodeResetPassWord {
  Crud crud;
  VeryfyCodeResetPassWord(this.crud);

  VerfyCodeResetPassWordPostData(String emal,String verfycode)async{
     var response=await crud.postData(AppLinks.verfiycodeforgetpass, {
      "verfiycode":verfycode,
      "email":emal,
     
     });
    return response.fold((l) => l, (r) => r);
  }
 }