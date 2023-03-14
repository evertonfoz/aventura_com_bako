import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class GamificationPage extends StatelessWidget {
  GamificationPage(
      {super.key, required this.gameChoice, required this.gamification});
  final int gameChoice;
  GamificationUser gamification;

  @override
  Widget build(BuildContext context) {
    switch (gameChoice) {
      case 1:
        return quizzGame();

      case 2:
        return quizzGame();
    }
    return quizzGame();
  }

  Widget memoryGame() {
    return HomePageMemoryGame();
  }

  Widget quizzGame() {
    return HomePageQuizz();
  }

  Widget cacaPalavras() {
    return HomeCacaPalavras(gamification: gamification);
  }

  Widget home() {
    return const Scaffold();
  }
}
