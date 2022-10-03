import 'package:flutter/material.dart';
import '../../data/model/questions_list.dart';
import 'widgets/result_page.dart';
import 'widgets/quizz_colors.dart';

class HomePageQuizz extends StatefulWidget {
  const HomePageQuizz({Key? key}) : super(key: key);

  @override
  State<HomePageQuizz> createState() => _HomePageQuizzState();
}

class _HomePageQuizzState extends State<HomePageQuizz> {
  final PageController? _controllerPage = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz do Bako'),
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
            padding: const EdgeInsets.all(20.0),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controllerPage!,
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
                      height: 70.0,
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
                  score += 10;
                  print(score);
                }
              },
        child: Text(
          questions[index].answer.keys.toList()[i],
          style: const TextStyle(color: Colors.white),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultPage(score))));
                    }
                  : () {
                      _controllerPage!.nextPage(
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
      height: 100,
      width: 100,
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
