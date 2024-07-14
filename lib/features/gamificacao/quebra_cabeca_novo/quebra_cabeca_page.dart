import 'package:aventura_com_bako/features/gamificacao/quebra_cabeca_novo/widgets/quebra_cabeca_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuebraCabecaPage extends StatefulWidget {
  const QuebraCabecaPage({super.key});

  @override
  State<QuebraCabecaPage> createState() => _QuebraCabecaPageState();
}

class _QuebraCabecaPageState extends State<QuebraCabecaPage> {
  int gridSize = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: const Text('Quebra-cabeça'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.white38, BlendMode.screen),
                      image: AssetImage('assets/Padrão4.jpg'),
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.amberAccent.withOpacity(0.7),
                        blurRadius: MediaQuery.of(context).size.width * 2,
                      )
                    ]),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: gridSize == 2
                              ? null
                              : () {
                                  setState(() {
                                    gridSize = 2;
                                  });
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Fácil',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                            onPressed: gridSize == 3
                                ? null
                                : () {
                                    setState(() {
                                      gridSize = 3;
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Médio',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        ElevatedButton(
                            onPressed: gridSize == 4
                                ? null
                                : () {
                                    setState(() {
                                      gridSize = 4;
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Difícil',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const Divider(),
                    // Display moves count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          width: 250,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white60,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Movimentos: ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "Letters_for_leaners"),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 0.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    // Display the puzzle
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            width: constraints.biggest.width,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.green,
                                width: 8,
                              ),
                            ),
                            child: SlidePuzzleWidget(
                              size: constraints.biggest,
                              sizePuzzle: gridSize,
                              imageBckGround: Image.asset(
                                  'assets/games/quebra_cabeca_teste.jpeg'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
