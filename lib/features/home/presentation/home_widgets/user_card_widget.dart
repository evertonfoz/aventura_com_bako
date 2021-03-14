import 'dart:ui';

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final double circleRadius = 150.0;
  final double circleBorderWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Card(
              child: Container(
                height: 450,
                child: Column(
                  children: [
                    Container(
                      width: 370,
                      height: 70,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nível: 1/30",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "Amigos: 2",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 380,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Nathã Luca",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pontos: 1234/4000",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF085c00),
                                  ),
                                ),
                                Text(
                                  "Créditos: 13",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF085c00),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/icons/map.png"),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/icons/game.png"),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/icons/qr_code.png"),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 100,
                                  child: Image.asset("assets/icons/book.png"),
                                ),
                              ],
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // Profile photo
            width: circleRadius,
            height: circleRadius,
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(circleBorderWidth),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/66957319?s=400&u=cd4df0aa31a432e77b14a1b853f705f62fb5d2be&v=4',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
