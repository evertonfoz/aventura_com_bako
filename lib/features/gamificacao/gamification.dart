import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class GamificationPage extends StatelessWidget {
  const GamificationPage({super.key, required this.gameChoice});
  final int gameChoice;

  @override
  Widget build(BuildContext context) {
    print(gameChoice);
    switch (gameChoice) {
      case 1:
        return memoryGame();

      case 2:
        return cacaPalavras();
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
    return HomeCacaPalavras();
  }

  Widget home() {
    return Scaffold();
  }
}
