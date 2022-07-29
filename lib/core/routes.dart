import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/splash/presentation/pages/splash_screen.dart';
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
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case tutorial:
        return MaterialPageRoute(builder: (_) => TutorialPage());
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
