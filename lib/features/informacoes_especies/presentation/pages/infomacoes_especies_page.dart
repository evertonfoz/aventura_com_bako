import 'dart:math';

import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/informacoes_especies/presentation/controller/informacoes_controller.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesEspeciesPage extends StatefulWidget {
  const InformacoesEspeciesPage(
      {Key? key, required this.mapa, required this.gamification})
      : super(key: key);

  final MapScreen mapa;
  final GamificationUser gamification;

  @override
  State<InformacoesEspeciesPage> createState() =>
      _InformacoesEspeciesPageState();
}

class _InformacoesEspeciesPageState extends State<InformacoesEspeciesPage> {
  InformacoesEspeciesController controller =
      Get.put(InformacoesEspeciesController());
  Random random = Random();
  late int randomGame;

  @override
  void initState() {
    if (widget.mapa.placar == 20) {
      widget.mapa.fullScore = true;
    } else {
      widget.mapa.placar++;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (controller.especieLida.value.nomeCientifico == null) {
            widget.mapa.placar--;
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                Visibility(
                  visible: controller.especieLida.value.nomeCientifico == null,
                  child: Container(
                    color: Colors.green,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.85,
                            // height: 200,
                            decoration: const ShapeDecoration(
                              color: Colors.yellow,
                              shape: TooltipShapeBorder(
                                arrowArc: 0.5,
                                arrowHeight: 35,
                              ),
                              shadows: [
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
                                  TextECA(
                                    text:
                                        'Olá, eu sou o Bako e vou te acompanhar nessa aventura!',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 10),
                                  TextECA(
                                    text:
                                        'Pelo visto, algum problema ocorreu com o QR CODE lido. Pode tentar novamente, pois não identifiquei nele dados da espécie.',
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200.00,
                          height: 200.00,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/bako_vetor.png'), //TODO Constantes
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
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
                Positioned(
                  right: 5,
                  top: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        ColorUtils.hexToInt("#FEE784"),
                      ),
                      border:
                          Border.all(width: 0.5, color: Colors.grey.shade500),
                    ),
                    child: GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: Color(
                          ColorUtils.hexToInt("#788A25"),
                        ),
                      ),
                      onTap: () {
                        widget.mapa.overlays.remove('QrCodePage');
                        widget.mapa.overlays.remove('InformacoesEspeciesPage');

                        controller.setEspecieLida();

                        if (widget.mapa.fullScore) {
                          widget.mapa.overlays
                              .add('DescobriuTodasEspeciesPage');
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.especieLida.value.nomeCientifico != null,
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
                                    '${controller.especieLida.value.nomeCientifico}',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontStyle: FontStyle.italic,
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
                                'Família ${controller.especieLida.value.familia}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(
                                    ColorUtils.hexToInt("#94BF36"),
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
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
                              '${controller.especieLida.value.nomesPopulares}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${controller.especieLida.value.exposicao}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
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
