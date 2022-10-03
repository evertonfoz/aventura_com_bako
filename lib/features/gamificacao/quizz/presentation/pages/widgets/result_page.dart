import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int score;

  const ResultPage(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Parabens'),
          Text(widget.score.toString()),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageQuizz()));
            },
            color: Colors.yellow,
            textColor: Colors.white,
            child: const Text('Sair'),
          )
        ],
      ),
    );
  }
}
