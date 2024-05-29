import 'package:drive_testapp/Binding/initialBinding.dart';
import 'package:drive_testapp/Core/Localization/changelocal.dart';
import 'package:drive_testapp/Core/services/services.dart';
import 'package:drive_testapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialServices();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     LocalController controller= Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appThem,
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      getPages: routesPages,
      initialBinding: InitialBindings(),

    );
  }
}

