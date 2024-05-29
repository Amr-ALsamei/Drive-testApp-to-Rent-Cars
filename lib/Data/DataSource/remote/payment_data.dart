import 'package:drive_testapp/Core/class/Crud.dart';
import 'package:drive_testapp/linkAPI.dart';

class PaymentData {
  Crud crud;
  PaymentData(this.crud);

  addpayment(String userid,String accountno,String namecard,String paymentamount)async{
    
     var response=await crud.postData(AppLinks.addpayment, {
           "userId":userid.toString(),
           "accountNo":accountno.toString(),
           "nameCard":namecard.toString(),
           "paymentamount":paymentamount.toString(),
          
     });
    return response.fold((l) => l, (r) => r);
  }
  
  }