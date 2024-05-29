
import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/linkAPI.dart';

class FavoritesdData {
  Crud crud;
  FavoritesdData(this.crud);

  PostData(String userid,String  carid, String favoriteval)async{
     var response=await crud.postData(AppLinks.Favoritupdate, {
      "userid":userid.toString(),
      "carid":carid.toString(),
      "favoriteval":favoriteval.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }
  searchFavoriteData(String itemname,String userid)async{
     var response=await crud.postData(AppLinks.searchFavorit, {
      "carName":itemname,
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

 viewFavoriteData(String userid)async{
     var response=await crud.postData(AppLinks.viewFavorit, {
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }