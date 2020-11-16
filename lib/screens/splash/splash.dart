import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new ExactAssetImage('assets/background-splash.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Desenvolvido pelo time da UTFPR',
                style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 50.0, left: 70.0, right: 70.0),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/bako_vetor.png',
                fit: BoxFit.fitWidth,
              )),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 40.0, top: 110.0, right: 40.0),
            child: Image.asset('assets/idv.png'),
          )
        ],
      )),
    );
  }
}
