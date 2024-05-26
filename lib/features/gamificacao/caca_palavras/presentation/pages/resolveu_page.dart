import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class CacaPalavrasResolveuPage extends StatelessWidget {
  const CacaPalavrasResolveuPage(
      {super.key,
      required this.user,
      required this.notifyParent,
      required this.areajogavel});

  final Function() notifyParent;
  final GamificationUser user;
  final Widget areajogavel;

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
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Parabéns, você encontrou todas as palavras!',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(right: 40),
                            ),
                            const Divider(),
                            SizedBox.square(
                              dimension:
                                  MediaQuery.of(context).size.width * 0.6,
                              child: areajogavel,
                            ),
                            const Divider(),
                            const Text(
                              'Parabéns! 🎉 Você completou o caça-palavras e mostrou sua inteligência e dedicação. Encontrar todas as palavras ajuda a proteger o meio ambiente. Continue assim, pequeno guardião da natureza! 🌿🔍✨',
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
                                        builder: (context) => HomeCacaPalavras(
                                            user: user,
                                            notifyParent: notifyParent),
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
