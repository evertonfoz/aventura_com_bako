import 'package:aventura_com_bako/core/routes.dart';
import 'package:aventura_com_bako/features/login/data/repositories/firebase_auth_repository.dart';
import 'package:aventura_com_bako/features/splash/presentation/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FireAuth>(
          create: (_) => FireAuth(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<FireAuth>().authState)
      ],
      child: LayoutBuilder(builder: (context, constraints) {
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
          home: SplashScreen(),
        );
      }),
    );
  }
}
