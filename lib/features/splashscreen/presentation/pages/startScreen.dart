import 'package:aventura_com_bako/features/galeria/presentation/pages/galeria_screen.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final GamificationUser gamificationUser = GamificationUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/Inicial2_1080x1920.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Bako_1281x1423.png',
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.45,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/idv.png',
                    fit: BoxFit.contain,
                    height: 70,
                  ),
                  const SizedBox(width: 8),
                  Builder(
                    builder: (context) => SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Icon(
                          Icons.arrow_right,
                        ),
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
