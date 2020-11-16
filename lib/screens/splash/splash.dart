import 'package:aventura_com_bako/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Size size;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
                'Desenvolvido pelo time da UTFPR',
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
              // left: 40.0,
              top: size.height * 0.1,
              // right: 40.0,
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
