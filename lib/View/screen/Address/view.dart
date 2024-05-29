import 'package:drive_testapp/Controller/Address/view_Controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Data/Model/AddressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViews extends StatelessWidget {
  
  const AddressViews({super.key});

  @override
  Widget build(BuildContext context) {
   
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: const Text("Address"),),
      
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardAddressData(
                    onDelet: () {
                      controller.deleteAddressData(controller.data[index].addressID.toString());
                     },
                    addressModel: controller.data[index],
                    );
                }
                
              ),
            ),
          
      ),
    ));
  }
}

class CardAddressData extends GetView<AddressViewController> {
  final AddressModel addressModel;
  final  void Function()? onDelet;
  const CardAddressData({super.key,required this.onDelet, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
                     padding: const EdgeInsets.all(15),
                      child: ListTile(title: Text("Name: ${addressModel.addressName}",style: const TextStyle(fontSize: 18),),
                             subtitle:Text("Location: ${addressModel.addressCity}  ${addressModel.addressStreet}" ,
                            ),
                            trailing: IconButton(
                              onPressed: onDelet, icon: const Icon(Icons.delete)),
                            ),
                    ),
                  );
  }
}