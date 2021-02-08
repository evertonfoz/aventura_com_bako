import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return LayoutBuilder(builder: (context, constraints) {
      ScreenUtil.init(constraints,
          designSize: Size(393, 813), allowFontScaling: false);
      return MaterialApp(
        title: 'Aventura com Bako',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Nunito',
        ),
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: Routes.navigatorKey,
        initialRoute: Routes.splashScreen,
        home: HomeScreen(),
      );
    });
  }
}
