class AppLinks{

  // static const String server="http://10.0.2.2/Drive_Test";
  static const String server="http://amrecommerce112.000webhostapp.com/Drive_Test";
  // static const String server="Drive_Test";
  


  static const String imagestatic="$server/upload";
  // ======================images============================
  static const String imagecars="$imagestatic/Cars";
  // static const String imageitem="$imagestatic/item";
  // ======================================================
 
  // //****************Auth***************** */
  static const String signup="$server/Auth/signUp.php";
  static const String verfycode="$server/Auth/verfiycode.php";
  static const String login="$server/Auth/login.php";
  static const String resendVerfycode="$server/Auth/Resend.php";

  /////////////////forget password//////////////////////
  static const String chechemail="$server/ForgetPassword/checkEmail.php";
  static const String verfiycodeforgetpass="$server/ForgetPassword/verfycode.php";
  static const String resetpassword="$server/ForgetPassword/ResetPassword.php";

  ///////////////////////////////////////////////////////////////////////////////////////
  
  //////////////Cars/////////////////////////
  static const String carsview="$server/Cars/view.php";
  static const String carsadd="$server/Cars/add.php";
  static const String carsedit="$server/Cars/edit.php";
  static const String carsdelete="$server/Cars/delete.php";
  static const String searchcar="$server/Cars/search.php"; 

  static const String Favoritupdate="$server/Favorite/UpdateFavorite.php";
  static const String viewFavorit="$server/Favorite/ViewfavoritesCar.php";
  static const String searchFavorit="$server/Favorite/search.php";
  
  ///////////////////////////////////////////////////////////////////////////////////////
  

  //////////////Address/////////////////////////
  static const String addAddress="$server/Address/add.php";
  static const String deleteAddress="$server/Address/delete.php";
  static const String viewAddress="$server/Address/view.php";
  static const String editAddress="$server/Address/edit.php"; 

 static const String addpayment="$server/Payment/Add.php";
  // static const String searchcar="$server/Cars/search.php"; 


  ///////////////Notification////////////////////
  static const String notifications="$server/Notification.php";


  

  
}