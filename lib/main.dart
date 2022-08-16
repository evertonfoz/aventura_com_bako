import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/splashscreen/presentation/pages/splashscreen.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/constants/app_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();

  await hideStatusBarAndSetColorToNavigationBar(
      navigationBarColor: kBrandColor);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aventura com Bako',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kBrandColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
      ),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: Routes.navigatorKey,
      initialRoute: Routes.splashScreen,
      home: SplashScreenPage(),
    );
  }
}
