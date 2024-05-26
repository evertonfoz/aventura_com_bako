import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class MemoriaResolveuPage extends StatelessWidget {
  MemoriaResolveuPage({
    super.key,
    required this.refresh,
    required this.user,
    required this.isEasy,
    required this.audioController,
  });

  final Function() refresh;
  final GamificationUser user;
  final bool isEasy;
  final AudioController audioController;

  final List easyImages = [
    "assets/games/Memoria/abelha.png",
    "assets/games/Memoria/agua.png",
    "assets/games/Memoria/BEIJAFLOR.png",
    "assets/games/Memoria/bosque.png",
    "assets/games/Memoria/cactos.png",
    "assets/games/Memoria/cipo.png",
  ];

  final List hardImages = [
    "assets/games/Memoria/epifita.png",
    "assets/games/Memoria/ervdepassarinho.png",
    "assets/games/Memoria/folhas de manga.png",
    "assets/games/Memoria/frutomanga.png",
    "assets/games/Memoria/fungo.jpeg",
    "assets/games/Memoria/hibisco.png",
    "assets/games/Memoria/morgueso.png",
    "assets/games/Memoria/sementeauracauria.png",
    "assets/games/Memoria/serra.png",
    "assets/games/Memoria/solo.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parabéns, resolvido!'),
      ),
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
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.amberAccent.withOpacity(0.7),
                    blurRadius: MediaQuery.of(context).size.width * 2,
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.015,
                    right: MediaQuery.of(context).size.width * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(25),
                        //   topRight: Radius.circular(25),
                        // ),
                        color: Color.fromARGB(255, 255, 244, 145),
                        shape:
                            TooltipShapeBorder(arrowArc: 0.5, arrowHeight: 20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 50),
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Parabéns, você achou todas os pares!',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(right: 40),
                            ),
                            const Divider(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: isEasy
                                        ? easyImages.length
                                        : hardImages.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: isEasy ? 3 : 5,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: isEasy ? 1.5 : 1,
                                    ),
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: constraints.maxHeight,
                                        child: Image(
                                          image: AssetImage(isEasy
                                              ? easyImages[index]
                                              : hardImages[index]),
                                        ),
                                      );
                                    });
                              }),
                            ),
                            const Divider(),
                            const Text(
                              'Parabéns! 🎉 Você completou o jogo da memória e mostrou sua inteligência e dedicação. Lembrar de cada par ajuda a proteger o meio ambiente. Continue assim, pequeno guardião da natureza! 🌿🧠✨',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            const Divider(),
                            const Text(
                              'Deseja jogar novamente?',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  child: const Text('Sim!'),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomePageMemoryGame(
                                          audioController: audioController,
                                          isEasy: isEasy,
                                          user: user,
                                          notifyParent: refresh,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                TextButton(
                                  child: const Text('Não'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/Bako_com_grama.png'), //TODO Constantes
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
