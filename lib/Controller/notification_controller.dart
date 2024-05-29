
import 'package:drive_testapp/Core/class/statusrequest.dart';
import 'package:drive_testapp/Core/function/handlingdata.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/DataSource/remote/Notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

 NotificationData notificationData=NotificationData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List data=[];

   StatusRequest statusRequest=StatusRequest.None;

  getnotifications()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await notificationData.getNotificationData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  @override
  void onInit() {
    getnotifications();
    super.onInit();
  }

}