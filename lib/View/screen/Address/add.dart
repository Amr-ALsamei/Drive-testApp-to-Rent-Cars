
import 'package:drive_testapp/Controller/Address/Add_Controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text("Set Your Location"),),
      body: GetBuilder<AddAddressController>(
        builder: (controllerPage) {
          return HandlingDataView(
            statusRequest: controllerPage.statusRequest,
            widget: Column(
              children: [
               if(controllerPage.kGooglePlex!=null)
               
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                                mapType: MapType.normal,
                                markers: controllerPage.markers.toSet(),
                                onTap: (latlng) {
                                  controllerPage.addMarkers(latlng);
                                  
                                },
                                initialCameraPosition:controllerPage.kGooglePlex!,
                                onMapCreated: (GoogleMapController controllermap) {
                                controllerPage.completercontroller!.complete(controllermap);
                                },
                              ),

                    Positioned(
                      bottom: 20,
                      child: Container(
                    
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: (){
                            controllerPage.goToAddressDetails();
                          },
                          color: Appcolors.primarycolor,
                          textColor: Colors.white,
                          child: const Text("Continuoe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                        ],
                      ),
                    ),
                    
                  
          
              ],
            ),
          );
        }
      ),
    );
  }
}