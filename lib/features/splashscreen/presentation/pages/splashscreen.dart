import 'package:aventura_com_bako/features/splashscreen/presentation/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO Organizar assets em pastas e usar constantes

// ignore: must_be_immutable
class SplashScreenPage extends StatelessWidget {
  SplashScreenController controller = Get.put(SplashScreenController());

  SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/Tela_Inicial2.png'), //TODO Constants
                fit: BoxFit.cover,
              ),
            ),
            // child: Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Text(
            //     Texts.desenvolvidoPor,
            //     style: const TextStyle(
            //       fontFamily: 'Arial',
            //       fontSize: 20,
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     textAlign: TextAlign.center,
            //     textDirection: TextDirection.ltr,
            //   ),
            // ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 50.0),
          //   alignment: Alignment.bottomCenter,
          //   child: Image.asset(
          //     'assets/Bako_1281x1423.png',
          //     fit: BoxFit.fitWidth,
          //     height: size.width * 0.8,
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
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
