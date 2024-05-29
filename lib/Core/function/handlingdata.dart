
import 'package:drive_testapp/Core/class/statusrequest.dart';

handlingData(response){
  if(response is StatusRequest){
     return response;
  }else{
    return StatusRequest.success;
  }
}