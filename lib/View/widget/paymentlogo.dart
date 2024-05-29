
import 'package:drive_testapp/Core/constant/imageAssest.dart';
import 'package:flutter/widgets.dart';

class LogoPayment extends StatelessWidget {
  const LogoPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAssets.logopayment,width: 170,height: 170,);
  }
}