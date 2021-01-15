<<<<<<< HEAD
import 'package:aventura_com_bako/screens/home/home_screen.dart';
import 'package:aventura_com_bako/screens/login/login_screen.dart';
import 'package:aventura_com_bako/screens/splash/splash_screen.dart';
import 'package:aventura_com_bako/screens/tutorial/tutorial_screen.dart';
=======
<<<<<<< HEAD
import 'package:aventura_com_bako/screens/home/home_screen.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/login_page.dart';
import 'package:aventura_com_bako/screens/tutorial/tutorial_app.dart';
import 'package:aventura_com_bako/screens/tutorial/page_tutorial.dart';
=======
import 'package:aventura_com_bako/screens/tutorial/page_tutorial.dart';
>>>>>>> 8115c67cb9c377a105f24dae46a70f5fca67e69f
>>>>>>> d49da3c196149ee4dd5967a243cc62cbfa2f5563
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
        home: TutorialPage(),
      );
    });
  }
}
