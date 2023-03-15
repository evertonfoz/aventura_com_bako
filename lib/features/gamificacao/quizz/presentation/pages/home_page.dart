import 'package:aventura_com_bako/features/gamificacao/alert_game.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/widgets/result_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/widgets/score_board.dart';
import 'package:flutter/material.dart';
import '../../data/model/questions_list.dart';
import '../widgets/quizz_colors.dart';

class HomePageQuizz extends StatefulWidget {
  HomePageQuizz({required this.gamification, Key? key}) : super(key: key);

  GamificationUser gamification;

  @override
  State<HomePageQuizz> createState() => _HomePageQuizzState();
}

class _HomePageQuizzState extends State<HomePageQuizz> {
  final PageController _controllerPage = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz do Bako'),
        centerTitle: true,
      ),
      backgroundColor: QuizzColors.mainColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.white38, BlendMode.screen),
                    image: AssetImage('assets/Padrão4.jpg'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: cabecalho('titlePage', score, 0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controllerPage,
              onPageChanged: (page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${index + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 8.0,
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    questions[index].imageQuestion == true
                        ? questionImage(index)
                        : questionText(index),
                    const SizedBox(height: 10.0),
                    for (int i = 0; i < questions[index].answer.length; i++)
                      questions[index].imageQuestion == true
                          ? awnserImage(index, i)
                          : bottomAwnser(index, i),
                    nextPageBottom(index),
                  ],
                );
              },
              itemCount: questions.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomAwnser(index, i) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      child: MaterialButton(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: isPressed
            ? questions[index].answer.entries.toList()[i].value
                ? QuizzColors.isTrue
                : QuizzColors.isWrong
            : QuizzColors.secondColor,
        onPressed: isPressed
            ? () {}
            : () {
                setState(() {
                  isPressed = true;
                });
                if (questions[index].answer.entries.toList()[i].value) {
                  score += 5;
                }
              },
        child: Text(
          questions[index].answer.keys.toList()[i],
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              wordSpacing: 3),
        ),
      ),
    );
  }

  Widget nextPageBottom(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: isPressed
              ? index + 1 == questions.length
                  ? () {
                      widget.gamification.updatePontuacao(score);
                      AlertGame(pontos: score).alertWin(context);
                    }
                  : () {
                      _controllerPage.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                      setState(() {
                        isPressed = false;
                      });
                    }
              : null,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const StadiumBorder(),
            side: const BorderSide(color: Colors.white, width: 1.0),
          ),
          child: Text(
            index + 1 == questions.length
                ? "Ver resultado"
                : 'Próxima pergunta',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  questionText(index) {
    return Text(
      questions[index].question!,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    );
  }

  questionImage(index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width * 0.15,
      child: Image.asset(questions[index].question!),
    );
  }

  awnserImage(index, i) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: isPressed
                  ? questions[index].answer.entries.toList()[i].value
                      ? QuizzColors.isTrue
                      : QuizzColors.isWrong
                  : QuizzColors.secondColor,
              onPressed: isPressed
                  ? () {}
                  : () {
                      setState(() {
                        isPressed = true;
                      });
                      if (questions[index].answer.entries.toList()[i].value) {
                        score += 10;
                        print(score);
                      }
                    },
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(questions[index].answer.keys.toList()[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
