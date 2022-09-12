import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MemoryGameModel _gameModel = MemoryGameModel();
  @override
  void initState() {
    super.initState();
    _gameModel.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
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
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/background_forest.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Card(
                  child: Container(
                    color: Colors.green,
                    child: TextButton(
                      child: const Text(
                        'Mapa',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Center(
              child: Column(
                children: [
                  Card(
                    child: Container(
                      color: Colors.green,
                      child: TextButton(
                        child: const Text(
                          'JOGOS',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeGamePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
