
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/Data/Model/carsModel.dart';
import 'package:get/get.dart';

class CarsDetailsController extends GetxController{

List<CarsModel> cardetails=[];
int indx=0;
int? type;
MyServices myServices=Get.find();
  @override
void onInit() {
    cardetails=Get.arguments["carDetails"];
    indx=Get.arguments["index"];
    type=myServices.sharedPref.getInt("type");
    super.onInit();
  }
}