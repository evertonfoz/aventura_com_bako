import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            );
          },
        ),
        title: Image.asset(
          'assets/idv.png',
          fit: BoxFit.contain,
          height: 45,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/background_forest.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Card(
              child: Container(
                color: Colors.green,
                child: TextButton(
                  child: Text('Mapa'),
                  onPressed: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
