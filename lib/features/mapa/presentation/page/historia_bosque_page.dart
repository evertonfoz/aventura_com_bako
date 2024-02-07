import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/instrucoes_timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';

import '../../../splashscreen/presentation/pages/startScreen.dart';

class HistoriaPage extends StatefulWidget {
  HistoriaPage({super.key, required this.audioController, required this.user});

  final GamificationUser user;
  final AudioController audioController;

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

  Future<bool?> showDialogHistoriaBosque() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.black,
          insetPadding: EdgeInsets.all(8.0),
          elevation: 8,
          shape: CircleBorder(),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 244, 145),
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
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          'Toda a região onde hoje está a Utfpr era recoberta pela Floresta Estacional Semidecidual. Com o passar do tempo, a cidade de Medianeira foi crescendo e com isso boa parte de sua vegetação nativa foi dando lugar a áreas urbanas, fazendo com que essa vegetação acabasse ficando restrita a pequenos fragmentos, como é o caso do Bosque da Utfpr. O bosque foi adquirido pela universidade em 2013 com o intuito de ser utilizado para fins de estudos pelos cursos da área ambiental. Hoje, também faz parte das atividades de extensão do campus, sendo utilizado por várias crianças do município que o visitam em busca de uma aventura do conhecimento.',
                          style: TextStyle(),
                          textAlign: TextAlign.justify),
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
        audioIsPlaying = state == PlayerState.playing;
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
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                      'assets/images/Inicial2_1080x1920.png'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
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
                          const SizedBox(height: 10),
                          const Text(
                            'A história do bosque da UTFPR é muito importante! Clique no botão abaixo para saber mais sobre ela!',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Letters_for_leaners',
                              fontSize: 22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Clique aqui:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    color: Colors.green,
                                    icon: const Icon(
                                      Icons.history_edu,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      showDialogHistoriaBosque();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                            'assets/Bako_1281x1423.png'), //TODO Constantes
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.lightGreen,
                              border:
                                  Border.all(color: Colors.green, width: 5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.volume_up,
                                size: MediaQuery.of(context).size.width * 0.15,
                                color: Colors.white,
                              ),
                              FloatingActionButton(
                                heroTag: 'pauseWelcome',
                                onPressed: () async {
                                  if (audioIsPlaying) {
                                    await widget.audioController.playerFala
                                        .pause();
                                  } else {
                                    await widget.audioController.playerFala
                                        .resume();
                                  }
                                },
                                child: Icon(
                                  audioIsPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size:
                                      MediaQuery.of(context).size.width * 0.15,
                                  // color: kBrandColor,
                                ),
                              ),
                            ],
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
                                      builder: (context) =>
                                          InstrucoesTimelinePage(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
