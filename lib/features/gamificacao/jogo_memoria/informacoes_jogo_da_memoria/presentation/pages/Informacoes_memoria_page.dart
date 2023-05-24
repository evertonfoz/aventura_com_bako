import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/presentation/controller/jogoMemoria_controller.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class InformacoesMemoriaPage extends StatefulWidget {
  const InformacoesMemoriaPage(
      {required this.controller,
      required this.index,
      required this.audioController,
      super.key});

  final int index;
  final InformacoesJogoDaMemoriaController controller;
  final AudioController audioController;

  @override
  State<InformacoesMemoriaPage> createState() => _InformacoesMemoriaPageState();
}

class _InformacoesMemoriaPageState extends State<InformacoesMemoriaPage> {
  bool audioIsPlaying = false;
  @override
  void initState() {
    widget.audioController.loadFalaFromJson(
        widget.controller.informacoesJogoDaMemoriaList[widget.index].audioURL!);
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorizando com Bako'),
      ),
      backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.controller.informacoesJogoDaMemoriaList[widget.index]
                            .assets ??
                        'assets/hidden.png',
                  ),
                  fit: BoxFit.fitHeight,
                ),
                color: Colors.transparent,
              ),
            ),
            Visibility(
              visible: widget.controller
                      .informacoesJogoDaMemoriaList[widget.index].titulo !=
                  null,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.33),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Color.fromARGB(255, 255, 244, 145),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 50),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.controller.informacoesJogoDaMemoriaList[widget.index].titulo}',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Color(
                                      ColorUtils.hexToInt("#94BF36"),
                                    ),
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/plant_icon.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 40),
                        ),
                        const Divider(),
                        Text(
                          '${widget.controller.informacoesJogoDaMemoriaList[widget.index].texto}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/Bako_1281x1423.png'), //TODO Constantes
                                  fit: BoxFit.fitHeight,
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
                                      size: 60,
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
