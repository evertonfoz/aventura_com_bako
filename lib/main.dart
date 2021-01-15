<<<<<<< HEAD
import 'package:aventura_com_bako/screens/home/home_screen.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/login_page.dart';
import 'package:aventura_com_bako/screens/tutorial/tutorial_app.dart';
import 'package:aventura_com_bako/screens/tutorial/page_tutorial.dart';
=======
import 'package:aventura_com_bako/screens/tutorial/page_tutorial.dart';
>>>>>>> 8115c67cb9c377a105f24dae46a70f5fca67e69f
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
        ),
        /*routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/tutorial': (context) => TutorialApp(),
          '/home': (context) => HomeScreen(),
        },
        initialRoute: '/',*/
        home: TutorialPage(),
      );
    });
  }
}
