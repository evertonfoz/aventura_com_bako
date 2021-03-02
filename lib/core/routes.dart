import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/login_page.dart';
import 'package:aventura_com_bako/features/splash/domain/usecases/authenticate.dart';
import 'package:aventura_com_bako/features/splash/presentation/pages/splash_screen.dart';
import 'package:aventura_com_bako/features/tutorial/presentation/pages/tutorial_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String splashScreen = '/splash';
  static const String login = '/login';
  static const String tutorial = '/tutorial';
  static const String home = '/home';
  static const String auth = '/auth';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(args);
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case tutorial:
        return MaterialPageRoute(builder: (_) => TutorialPage());
        break;
      case auth:
        return MaterialPageRoute(builder: (_) => Authenticate());
        break;
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: Container(
          child: Text('Rota não definida'),
        ),
      );
    });
  }
}
