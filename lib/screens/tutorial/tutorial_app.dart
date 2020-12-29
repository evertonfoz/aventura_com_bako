import 'package:aventura_com_bako/screens/tutorial/welcome.dart';
import 'package:flutter/material.dart';

class TutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: WelcomeTutorial(),
    );
  }
}
