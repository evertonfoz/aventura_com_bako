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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
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
              child: SizedBox(
                height: 450,
                child: Column(
                  children: [
                    Container(
                      width: 370,
                      height: 70,
                      color: Colors.white,
                    ),
                    Container(
                      width: 370,
                      height: 380,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
