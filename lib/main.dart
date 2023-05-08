import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/splashscreen/presentation/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/constants/app_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Firebase.initializeApp();
  /*await showStatusBarAndSetColorToNavigationBar(
      statusBarColor: Colors.transparent,
      navigationBarColor: Colors.green,
      darkContent: false);*/
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
          textTheme: Theme.of(context)
              .textTheme
              .apply(fontFamily: 'Letters_for_leaners', fontSizeFactor: 1.5)),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: Routes.navigatorKey,
      initialRoute: Routes.splashScreen,
      home: SplashScreenPage(),
    );
  }
}
