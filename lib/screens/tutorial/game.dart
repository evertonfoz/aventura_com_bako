import 'package:aventura_com_bako/screens/tutorial/map.dart';
import 'package:aventura_com_bako/screens/tutorial/story.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GameTutorial extends StatefulWidget {
  @override
  GameTutorialState createState() => GameTutorialState();
}

class GameTutorialState extends State<GameTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/background-splash.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Card(
                  child: SizedBox(
                    width: 350.w,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          height: 100.h,
                          width: 350.w,
                          child: Center(child: Image.asset('assets/idv.png')),
                        ),
                        Container(
                          color: Colors.green,
                          height: 300.h,
                          width: 350.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 100.h,
                                    child: Image.asset('assets/icons/game.png'),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'JOGAR',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      color: Colors.amberAccent[100],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 25.h),
                                  Center(
                                    child: Text(
                                      'Ganhe pontos descobrindo dicas durante o passeio e ainda resolva os mistérios da nossa aventura',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Anterior',
                        style: TextStyle(
                          color: Colors.amberAccent[100],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MapTutorial()));
                      },
                    ),
                    SizedBox(width: 50.w),
                    RaisedButton(
                      child: Text(
                        'Próximo',
                        style: TextStyle(color: Colors.amberAccent[100]),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    StoryTutorial()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 270.h,
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
