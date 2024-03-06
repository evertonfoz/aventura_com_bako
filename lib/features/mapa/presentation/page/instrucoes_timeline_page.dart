import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'mapa_main_page.dart';
import 'welcome_page.dart';

class InstrucoesTimelinePage extends StatefulWidget {
  InstrucoesTimelinePage(
      {Key? key, required this.user, required this.audioController})
      : super(key: key);

  final GamificationUser user;
  final AudioController audioController;
  @override
  State<InstrucoesTimelinePage> createState() => _InstrucoesTimelinePageState();
}

class _InstrucoesTimelinePageState extends State<InstrucoesTimelinePage> {
  bool audioIsPlaying = false;
  @override
  void initState() {
    super.initState();
    widget.audioController.loadFalaInstrucoesPage();
  }

  @override
  void dispose() {
    widget.audioController.playerFala.stop();
    super.dispose();
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
        return widget.audioController.loadFalaHistoria();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Passeio no bosque')),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                                'assets/idv.png'), //TODO Constantes
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
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
                          children: const [
                            Text(
                              'Sua aventura está prestes a começar!',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Mas antes, vamos à algumas orientações',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
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
                    Expanded(
                      child: Timeline.tileBuilder(
                        theme: TimelineThemeData(
                          nodePosition: 0,
                          indicatorTheme: IndicatorThemeData(
                            size: 20,
                            color: Color(
                              ColorUtils.hexToInt("#FEE784"),
                            ),
                          ),
                          connectorTheme: ConnectorThemeData(
                            color: Color(
                              ColorUtils.hexToInt("#FEE784"),
                            ),
                            space: 30.0,
                            thickness: 5.0,
                            indent: 0,
                          ),
                        ),
                        builder: TimelineTileBuilder.fromStyle(
                          contentsAlign: ContentsAlign.basic,
                          contentsBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 5, left: 20, right: 100),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Colors.white60,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    textosDeInformacao[index],
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: textosDeInformacao.length,
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
                          heroTag: 'pauseInstrucoes',
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
                          heroTag: 'mapa',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MapPage(user: widget.user),
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
                  ),
                ],
              ),
            ],
          )),
    );
  }

  List<String> textosDeInformacao = [
    '1. Toque no botão abaixo para começar',
    '2. Utilize o controle para caminhar para os lados, frente e trás',
    '3. Ao chegar em uma árvore, será aberta a câmera para você apontar para o QR Code',
  ];
}
