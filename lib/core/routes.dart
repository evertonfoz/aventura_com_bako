import 'package:aventura_com_bako/features/splashscreen/presentation/pages/splashscreen.dart';
import 'package:aventura_com_bako/features/tutorial/presentation/pages/tutorial_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String splashScreen = '/splash';
  static const String login = '/login';
  static const String tutorial = '/tutorial';
  static const String home = '/home';
  static const String signup = '/signup';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case home:
      //return MaterialPageRoute(builder: (_) => HomeScreen(user));
      case tutorial:
        return MaterialPageRoute(builder: (_) => const TutorialPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erro'),
        ),
        body: const Text('Rota não definida'),
      );
    });
  }
}
