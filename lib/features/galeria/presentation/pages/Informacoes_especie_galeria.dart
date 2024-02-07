import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/galeria/controller/galeria_controller.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesGalleryPage extends StatefulWidget {
  InformacoesGalleryPage({
    required this.controller,
    required this.id,
    required this.audioController,
    Key? key,
  }) : super(key: key);

  final AudioController audioController;
  final InformacoesGalleryController controller;
  final int id;
  @override
  State<InformacoesGalleryPage> createState() => _InformacoesGalleryPageState();
}

class _InformacoesGalleryPageState extends State<InformacoesGalleryPage> {
  bool audioIsPlaying = false;

  @override
  void initState() {
    widget.audioController.loadFalaFromJson(
        widget.controller.informacoesEspeciesList[widget.id].audioURL!);
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
        audioIsPlaying = state == PlayerState.playing;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria'),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 300,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linear,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    width: 700,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Paineira-rosa-${itemIndex + 1}.jpg',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.controller.informacoesEspeciesList[widget.id]
                          .nomeCientifico !=
                      null,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 280),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${widget.controller.informacoesEspeciesList[widget.id].nomeCientifico}',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
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
                                        image:
                                            AssetImage('assets/plant_icon.png'),
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
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Família ${widget.controller.informacoesEspeciesList[widget.id].familia}',
                                style: TextStyle(
                                  color: Color(
                                    ColorUtils.hexToInt("#94BF36"),
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(500),
                                      topRight: Radius.circular(500),
                                      bottomLeft: Radius.circular(500),
                                      bottomRight: Radius.circular(500),
                                    ),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/icon-1.png'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    color: Colors.green[200],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Nomes populares',
                                  style: TextStyle(
                                    color: Color(
                                      ColorUtils.hexToInt("#94BF36"),
                                    ),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${widget.controller.informacoesEspeciesList[widget.id].nomesPopulares}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Divider(),
                            Text(
                              '${widget.controller.informacoesEspeciesList[widget.id].exposicao}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
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
                                            await widget
                                                .audioController.playerFala
                                                .pause();
                                          } else {
                                            await widget
                                                .audioController.playerFala
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
          );
        },
      ),
    );
  }
}
