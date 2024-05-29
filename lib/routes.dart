
import 'package:drive_testapp/Core/Middleware/AppMiddleWare.dart';
import 'package:drive_testapp/Core/constant/routesName.dart';
import 'package:drive_testapp/View/screen/Address/add.dart';
import 'package:drive_testapp/View/screen/Address/addressDetails.dart';
import 'package:drive_testapp/View/screen/Address/view.dart';
import 'package:drive_testapp/View/screen/Auth/verfyCodeSignUp.dart';
import 'package:drive_testapp/View/screen/Cars/CarsDetailsScreen.dart';
import 'package:drive_testapp/View/screen/FavoriteScreen.dart';
import 'package:drive_testapp/View/screen/Home.dart';
import 'package:drive_testapp/View/screen/Auth/SignApp.dart';
import 'package:drive_testapp/View/screen/Auth/Successed_SignUp.dart';
import 'package:drive_testapp/View/screen/Auth/forgetPassword/SuccessedResetPassword.dart';
import 'package:drive_testapp/View/screen/Auth/forgetPassword/forgetPassword.dart';
import 'package:drive_testapp/View/screen/Auth/forgetPassword/resetPassword.dart';
import 'package:drive_testapp/View/screen/Auth/forgetPassword/verfyCode.dart';
import 'package:drive_testapp/View/screen/Auth/login.dart';
import 'package:drive_testapp/View/screen/Cars/CarsAddScreen.dart';
import 'package:drive_testapp/View/screen/Cars/CarsEditScreen.dart';
import 'package:drive_testapp/View/screen/GetStartedApp.dart';
import 'package:drive_testapp/View/screen/Onboarding.dart';
import 'package:drive_testapp/View/screen/PaymentScreen.dart';
import 'package:drive_testapp/View/screen/successfullyRent.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



 List<GetPage<dynamic>>? routesPages=[
  
  GetPage(name: "/", page: ()=>const GetStartedAppScreen(),middlewares:[
    AppMiddleWare()
  ] ),
 
  GetPage(name: RoutesApp.signup, page: ()=>const SignApp()),
  GetPage(name: RoutesApp.verfyCodeSignUp, page: ()=>const VerificationCodeSignUp()),
  GetPage(name: RoutesApp.SuccessedSignUp, page: ()=>const SuccessedSignUp()),
  GetPage(name: RoutesApp.login, page: ()=>const LoginApp()),
  GetPage(name: RoutesApp.onbordingRoute, page: ()=>const OnBoarding()),
  GetPage(name: RoutesApp.forgetpassword, page: ()=>const ForgetPassword()),
  GetPage(name: RoutesApp.verfyCode, page: ()=>const VerificationCode()),
  GetPage(name:  RoutesApp.resetpassword, page: ()=>const ResetPassword()),
  GetPage(name: RoutesApp.SuccessResetPassword, page: ()=>const SuccessedResetPassword()),
  GetPage(name: RoutesApp.home, page: ()=>const HomeScreen()),
    //////////////////////Cars//////////////////
  // GetPage(name: RoutesApp.categoriesview, page: ()=>CarsViewScreen()),
  GetPage(name: RoutesApp.carssadd, page: ()=>const CarsAddScreen()),
  GetPage(name: RoutesApp.carsedit, page: ()=>const CarsEditScreen()),
   GetPage(name: RoutesApp.favoritepage, page: ()=>const CarsFavoriteScreen()),
   GetPage(name: RoutesApp.carsdetails, page: ()=>const CarsDetailsSreen()),
   /////////////Address////////////////////////////////
   GetPage(name: RoutesApp.addaddresspage, page: ()=>const AddressAdd()),
   GetPage(name: RoutesApp.addressdetailspage, page: ()=>const AddressDetails()),
   GetPage(name: RoutesApp.addressviewpage, page: ()=>const AddressViews()),

   GetPage(name: RoutesApp.paymentpage, page: ()=>const PayMentScreen()),
   GetPage(name: RoutesApp.succesrent, page: ()=>const SuccessedRentCar()),
  
 ];



