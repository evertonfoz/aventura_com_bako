import 'package:flutter/material.dart';
import 'package:testing/screens/getting_started_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: GettingStarted(),
    );
  }
}
