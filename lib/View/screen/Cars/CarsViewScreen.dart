
import 'package:drive_testapp/Controller/Cars/view_controller.dart';
import 'package:drive_testapp/Controller/Favorites_controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/Data/Model/carsModel.dart';
import 'package:drive_testapp/View/widget/CustomTapBar.dart';
import 'package:drive_testapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsViewScreen extends StatelessWidget {
  const CarsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
   FavoritesController favController= Get.put(FavoritesController());
    Get.put(CarsViewController());
    return Scaffold (
      body: GetBuilder<CarsViewController>(
        builder: (controller) {
          return Container(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  children: [
                ////////////////////////
                        CustomTabBar(
                        hinttext: "Find Your ideal Car",
                          onPressedIcon: (){},
             
                         onFavorite: () {
                         Get.toNamed(RoutesApp.favoritepage); 
                          },
                           onPressedSearch: () { 
                           controller.onSearchcar();
                            },
                          onChanged: (val) {
                             controller.checkSearch(val);
                               },
                               mycontroller: controller.searchcar!,
                             ) ,
                    ///////////////////////////////
                   
                   
                   HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget:  !controller.isSearch? Column(
                          children: [
                            const Text("Must Popular cars",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),),
                            ...List.generate(
                         controller.carsdata.length, (index)  {
                          favController.FavoriteMap[controller.carsdata[index].carId]=controller.carsdata[index].favorite;
                             return InkWell(
                              onTap: (){
                               controller.goToCarDetails(controller.carsdata,index);
                              },
                               child: Card(
                                                           child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Stack(
                                
                                children: [
                                  
                                  Row(
                                    children: [
                                      Expanded(
                                    flex: 2,
                                    child: Image.network("${AppLinks.imagecars}/${controller.carsdata[index].carImage}",
                                    height: 80,width: 80),
                                  //   child: CachedNetworkImage(imageUrl: "${AppLinks.imagecars}/${controller.carsdata[index].carImage}",
                                  // width: 80,height: 80,)
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: ListTile(
                                     
                                      title: Text(
                                        controller.carsdata[index].carModel!),
                                      subtitle: Text("${controller.carsdata[index].carYear}"),
                                        
                                    )
                                    ),
                                    ],
                                  ),
                                  
                                  Positioned(
                                    top: -2,
                                    right: 5,
                                    child: GetBuilder<FavoritesController>(
                                      builder: (favController) {
                                        return IconButton(
                                          onPressed: (){
                                            if(favController.FavoriteMap[controller.carsdata[index].carId]==1){
                                                     favController.changeFavoriValue(controller.carsdata[index].carId, 0);
                                            }else{
                                              favController.changeFavoriValue(controller.carsdata[index].carId, 1);
                                            }
                                            favController.PostFavoritesData(controller.carsdata[index].carId!,
                                            favController.FavoriteMap[controller.carsdata[index].carId]);
                                          },
                                           icon: Icon(favController.FavoriteMap[controller.carsdata[index].carId]==1?
                                            Icons.favorite:Icons.favorite_border,size: 30,color: Appcolors.primarycolor,));
                                      }
                                    )
                                        ),
                               
                                  
                                ],
                                
                                                           ),
                                                         ) ,
                                                         
                                                       ),
                             );}
                        
                        )
                          ],
                        ):CustomItemSearch(carsModel: controller.carsdata),
                      )
              
                  ],
                ),
              );
        }
      ),
    );
  }
}

class CustomItemSearch extends GetView<CarsViewController> {
  final List<CarsModel> carsModel;
  const CustomItemSearch({super.key, required this.carsModel,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:true ,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: carsModel.length,
      itemBuilder: (context, index) {
         return GetBuilder<CarsViewController>(
           builder: (controller) {
             return Container(
              margin: const EdgeInsets.only(top:10),
               child: Card(
                   child: Container(
                    padding: const EdgeInsets.all(5),
                     child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                // controller.goToProductDetails(lisiItemModel[index]);
                              },
                              child: Image.network(
                               "${AppLinks.imagecars}/${carsModel[index].carImage}",
                                 height: 150, width: 150),
                            //  child: CachedNetworkImage(
                            //   height: 150,
                            //   width: 150,
                            //   imageUrl: "${AppLinks.imagecars}/${carsModel[index].carImage}")
                              )
                              ),
                        
                         Expanded(child: ListTile(
                           title: Text("${carsModel[index].carModel}"),
                           subtitle: Text("${carsModel[index].carName}"),
                        ))
                      ],
                     ),
                   ),
               ),
             );
           }
         );
      },
    );
  }
}