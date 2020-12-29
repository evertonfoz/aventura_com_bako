import 'package:aventura_com_bako/screens/tutorial/map.dart';
import 'package:flutter/material.dart';

class WelcomeTutorial extends StatefulWidget {
  @override
  _WelcomeTutorialState createState() => _WelcomeTutorialState();
}

class _WelcomeTutorialState extends State<WelcomeTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/background-splash.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Card(
                  child: SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          height: 100,
                          width: 350,
                          child: Center(child: Image.asset('assets/idv.png')),
                        ),
                        Container(
                          color: Colors.green,
                          height: 280,
                          width: 350,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Center(
                              child: Text(
                                'Olá! Eu me chamo Bako, e vou contigo através dessa aventura. Vou te ensinar como jogar e explorar ao máximo nossa jornada!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: RaisedButton(
                    child: Text(
                      'Próximo',
                      style: TextStyle(color: Colors.amberAccent[100]),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MapTutorial(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 290,
                  child: Center(
                    child: Image.asset('assets/bako_vetor.png'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
