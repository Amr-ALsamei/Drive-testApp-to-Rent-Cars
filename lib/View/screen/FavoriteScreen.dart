
import 'package:drive_testapp/Controller/Favorites_controller.dart';
import 'package:drive_testapp/Core/class/handlingdataview.dart';
import 'package:drive_testapp/Core/constant/colors.dart';
import 'package:drive_testapp/Data/Model/favoriteModel.dart';
import 'package:drive_testapp/View/widget/CustomTapBar.dart';
import 'package:drive_testapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsFavoriteScreen extends StatelessWidget {
  const CarsFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(FavoritesController());
    
    return Scaffold (
      body: GetBuilder<FavoritesController>(
        builder: (controller) {
          return Container(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  children: [
                ////////////////////////
                        CustomTabBarFavorite(
                        hinttext: "Find Your ideal Favorite Car",
                          onPressedIcon: (){},
             
                         onFavorite: () {
                         // Get.toNamed(RoutesApp.favoriteItems); 
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
                            const Text("You Favorites cars",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),),
                            ...List.generate(
                         controller.favoritelist.length, (index)  {

                             return Card(
                            child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Stack(
                              
                              children: [
                                
                                Row(
                                  children: [
                                    Expanded(
                                  flex: 2,
                                  child:Image.network(
                                    "${AppLinks.imagecars}/${controller.favoritelist[index].carImage}",
                                     height: 150, width: 15)
                                //   CachedNetworkImage(imageUrl: "${AppLinks.imagecars}/${controller.favoritelist[index].carImage}",
                                // width: 15,height: 150,)
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                   
                                    title: Text(
                                      controller.favoritelist[index].carModel!,style: const TextStyle(fontSize: 20),),
                                    subtitle: Text("${controller.favoritelist[index].carName}",style: const TextStyle(fontSize: 20)),
                                      
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
                                          favController.onclickonFavorite(controller.favoritelist[index].carId!);
                                        },
                                         icon: const Icon( Icons.favorite,size: 30,color: Appcolors.primarycolor,
                                          )
                                          );
                                    }
                                  )
                                      ),
                              
                              Positioned(
                                  bottom: -2,
                                  right: 5,
                                  child:Text("${controller.favoritelist[index].carYear}",style: const TextStyle(fontSize: 20),) 
                                      ),

                                
                              ],
                              
                            ),
                          ) ,

                          
                        );}
                        
                        )
                          ],
                        ):CustomItemSearch(carsModel: controller.favoritelist),
                      )
              
                  ],
                ),
              );
        }
      ),
    );
  }
}

class CustomItemSearch extends GetView<FavoritesController> {
  final List<FavoriteModel> carsModel;
  const CustomItemSearch({super.key, required this.carsModel,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:true ,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: carsModel.length,
      itemBuilder: (context, index) {
         return Container(
          margin: const EdgeInsets.only(top:20),
           child: Card(
               child: Container(
                padding: const EdgeInsets.all(15),
                 child: Row(
                  children: [
                    Expanded(child: InkWell(
                          onTap: () {
                            // controller.goToProductDetails(lisiItemModel[index]);
                          },
                         child: Image.network( "${AppLinks.imagecars}/${carsModel[index].carImage}"))),
                    Expanded(child: ListTile(
                       title: Text("${carsModel[index].carModel}"),
                       subtitle: Text("${carsModel[index].carModel}"),
                    ))
                  ],
                 ),
               ),
           ),
         );
      },
    );
  }
}