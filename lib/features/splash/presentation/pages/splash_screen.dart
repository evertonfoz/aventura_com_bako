import 'package:aventura_com_bako/core/constants.dart';
import 'package:aventura_com_bako/features/splash/presentation/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/background-splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                Texts.desenvolvidoPor,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/bako_vetor.png',
              fit: BoxFit.fitWidth,
              height: size.width * 0.8,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
              top: size.height * 0.1,
            ),
            child: Image.asset(
              'assets/idv.png',
              width: size.width * 0.7,
            ),
          )
        ],
      ),
    );
  }
}
