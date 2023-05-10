import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/instrucoes_timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';

import '../../../splashscreen/presentation/pages/startScreen.dart';

class HistoriaPage extends StatefulWidget {
  HistoriaPage({super.key, required this.audioController, required this.user});

  GamificationUser user;
  AudioController audioController;

  @override
  State<HistoriaPage> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  bool audioIsPlaying = false;
  @override
  void initState() {
    super.initState();
    widget.audioController.loadFalaHistoria();
  }

  @override
  void dispose() {
    widget.audioController.playerFala.stop();
    super.dispose();
  }

  Future<bool?> showDialogFotoBosque() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.black,
          insetPadding: EdgeInsets.all(8.0),
          elevation: 8,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Bosque UTFPR Medianeira!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/images/BOSQUE.jpg'),
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: Colors.amber),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Voltar',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              backgroundColor: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.audioController.playerFala.onPlayerStateChanged.listen((state) {
      setState(() {
        audioIsPlaying = state == PlayerState.PLAYING;
      });
    });
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return widget.audioController.loadFalaWelcomePage();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Passeio no bosque'),
          ),
          body: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/Padrão4.jpg'), //TODO Constantes
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: ShapeDecoration(
                        color: Colors.yellow,
                        shape: TooltipShapeBorder(
                          arrowArc: 0.5,
                          arrowHeight: 35,
                        ),
                        shadows: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(2, 2))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Vamos conhecer mais o nosso bosque!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Letters_for_leaners',
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Toda a região onde hoje está a utfpr já foi área , região de Floresta Estacional Semidecidual. Esse é um tipo de formação florestal onde não existe a predominância de nenhuma espécie e cerca de 30% das suas espécies arbóreas perdem suas folhas durante a estação mais seca do ano. A medida que o tempo foi passando a cidade de Medianeira foi crescendo e com isso boa parte de sua vegetação nativa foi dando lugar a áreas urbanas, fazendo com que essas vegetações acabassem ficando restritas a pequenos fragmentos, que é o caso do Bosque da Utfpr. Essa área era pertencente à uma família tradicional do município que era dona de todas as terras da região da Utfpr. Acredita-se que o bosque tenha restado por ser uma área que foi deixada para cumprimento de legislações ambientais e somente a partir de 2013 passou a ser de propriedade da Utfpr, campus Medianeira. O bosque foi adquirido com o intuito de ser utilizado para fins de estudos pelos cursos da área ambiental.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Letters_for_leaners',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Clique aqui:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                      color: Colors.green,
                                      icon: const Image(
                                          image: AssetImage(
                                              'assets/icons/map.png')),
                                      onPressed: () {
                                        showDialogFotoBosque();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                              'assets/Bako_1281x1423.png'), //TODO Constantes
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: FloatingActionButton(
                          heroTag: 'pauseWelcome',
                          onPressed: () async {
                            if (audioIsPlaying) {
                              await widget.audioController.playerFala.pause();
                            } else {
                              await widget.audioController.playerFala.resume();
                            }
                          },
                          child: Icon(
                            audioIsPlaying ? Icons.pause : Icons.play_arrow,
                            size: 60,
                            // color: kBrandColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: FloatingActionButton(
                          heroTag: 'instrucoes',
                          onPressed: () {
                            widget.audioController.playerFala.pause();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InstrucoesTimelinePage(
                                  user: widget.user,
                                  audioController: widget.audioController,
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 60,
                            // color: kBrandColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
