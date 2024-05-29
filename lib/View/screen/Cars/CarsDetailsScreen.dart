
import 'package:drive_testapp/Controller/Cars/details_Controller.dart';
import 'package:drive_testapp/Controller/Cars/view_controller.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/constant/imageAssest.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsDetailsSreen extends StatelessWidget {
  const CarsDetailsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CarsViewController controllerview=Get.put(CarsViewController());
    CarsDetailsController controller=Get.put(CarsDetailsController());
    return Scaffold(
      bottomNavigationBar: controller.type==1? Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(onPressed:(){
                   Get.toNamed(RoutesApp.carssadd);
          } ,
            child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_box,color: Appcolors.primarycolor),
                      Text("Add",style: TextStyle(fontSize:12 , 
                      color: Colors.black,),)
                    ],
                  ),),
          MaterialButton(onPressed:(){
              Get.defaultDialog(
                      title:"Alert",
                      middleText: "Are you sure to delet Car",
                      onConfirm: (){
                        controllerview.deletCars(controller.cardetails[controller.indx].carId.toString(),
                       controller.cardetails[controller.indx].carName!);
                      },
                      onCancel: (){
                        
                      }
                       );
                    
          } ,
            child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete_forever,color: Appcolors.primarycolor),
                      Text("Delete",style: TextStyle(fontSize:12 , 
                      color: Colors.black,),)
                    ],
                  ),),
           MaterialButton(onPressed:(){
             Get.toNamed(RoutesApp.carsedit,arguments: {
                              "carsModel":controller.cardetails[controller.indx]
                            });
                    
             } ,
            child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit,color: Appcolors.primarycolor),
                      Text("Edit",style: TextStyle(fontSize:12 , 
                      color: Colors.black,),)
                    ],
                  ),),
          
          

               
        ],
      ):ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.thirdcolor,
                foregroundColor:Colors.white ,
                textStyle: const TextStyle(fontSize: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onPressed: (){
                Get.toNamed(RoutesApp.addaddresspage);
              },
              child: const Text("Rent This Car"),
              ),
      body: Stack(
        children: [
          SizedBox(
            // width: double.infinity,
            child: Image.asset( AppImageAssets.mapsimag, 
              height: double.infinity, width:double.infinity,fit: BoxFit.cover,),
            
          ),
        
        
        ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: false,
          children: [
            const SizedBox(height: 250,),
          Container(
              // height: 400,
            padding: const EdgeInsets.only(top: 10),
              child: Card(
                color: Appcolors.thirdcolor,
                child: Row(
                  children: [
                    Image.network(
                       "${AppLinks.imagecars}/${controller.cardetails[controller.indx].carImage!}",
                       height: 100, width: 150),
                    //  CachedNetworkImage(
                    //   width: 150,
                    //   imageUrl: "${AppLinks.imagecars}/${controller.cardetails[controller.indx].carImage}"
                    //   )   ,
                    Expanded(child: Column(
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text(
                            
                            "${controller.cardetails[controller.indx].carName!} Car \n ${controller.cardetails[controller.indx].carMake!} In ${controller.cardetails[controller.indx].carYear!} ",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),
                            textAlign: TextAlign.center,),
                        ],),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text(" ${controller.cardetails[controller.indx].carModel!} with ${controller.cardetails[controller.indx].carPricePerday!}\$ Per Day",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),
                            textAlign: TextAlign.center, ),
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text(" REGNO is ${controller.cardetails[controller.indx].carRegNo!}",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),
                            textAlign: TextAlign.center, ),
                          
                        
                        ],),
                        const Divider(),
                      
                        
                      ],
                    ))
                  ],
                ),
              ),
              ///////////////////////////////////
              
              //////////////////////////////////
            ),
         
            
          ],
              ) ,
              
        ],
      ),
    );
  }
}