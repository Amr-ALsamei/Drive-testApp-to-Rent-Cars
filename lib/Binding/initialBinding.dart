
import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}