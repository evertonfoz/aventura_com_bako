
import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/login_page.dart';
import 'package:aventura_com_bako/features/splash/presentation/pages/splash_screen.dart';
import 'package:aventura_com_bako/features/tutorial/presentation/pages/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/tutorial': (context) => TutorialPage(),
          '/home': (context) => HomeScreen(),
        },
        initialRoute: '/splash',
        home: HomeScreen(),
      );
    });
  }
}
