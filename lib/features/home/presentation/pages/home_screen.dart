import 'package:aventura_com_bako/features/home/presentation/home_widgets/user_card_widget.dart';
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
      body: HomePageHome(),
    );
  }
}

class HomePageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/background_forest.jpg',
            fit: BoxFit.cover,
          ),
        ),
        UserCard(),
        Positioned(
          bottom: 150,
          left: 15,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              "Bem-vindo(a) de volta. Aqui é o seu painel de controle. Escolha uma das ações acima e comece sua aventura agora mesmo!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            height: 220,
            child: Image.asset("assets/bako_vetor.png"),
          ),
        ),
      ],
    );
  }
}


