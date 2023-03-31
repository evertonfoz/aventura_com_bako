import 'package:aventura_com_bako/features/galeria/controller/galeria_controller.dart';
import 'package:aventura_com_bako/features/informacoes_especies/presentation/widgets/categoria_especie_widget.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesGalleryPage extends StatefulWidget {
  InformacoesGalleryPage({
    required this.controller,
    required this.id,
    Key? key,
  }) : super(key: key);

  InformacoesGalleryController controller;
  int id;
  @override
  State<InformacoesGalleryPage> createState() => _InformacoesGalleryPageState();
}

class _InformacoesGalleryPageState extends State<InformacoesGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Visibility(
                  visible: widget.controller.informacoesEspeciesList[widget.id]
                          .nomeCientifico ==
                      null,
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
                      onTap: () {},
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
                        color: Colors.white,
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
                                        fontSize: 40,
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
                              child: const Divider(),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Família ${widget.controller.informacoesEspeciesList[widget.id].familia}',
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
                                    color: Colors.yellow[200],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Nomes populares',
                                  style: TextStyle(
                                    fontSize: 20,
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
                                fontSize: 17,
                                color: Colors.black54,
                              ),
                            ),
                            CategoriaEspecie(
                              title: 'Fenologia',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].fenologia,
                              imageIcon: 'assets/icon-4.png',
                              color: Colors.cyan.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Altura',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].altura,
                              imageIcon: 'assets/icon-8.png',
                              color: Colors.pink.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Copa',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].copa,
                              imageIcon: 'assets/icon-2.png',
                              color: Colors.green.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Tronco',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].tronco,
                              imageIcon: 'assets/icon-3.png',
                              color: Colors.orange.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Flores',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].flores,
                              imageIcon: 'assets/icon-6.png',
                              color: Colors.red.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Folhas',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].folhas,
                              imageIcon: 'assets/icon-5.png',
                              color: Colors.teal.shade100,
                            ),
                            CategoriaEspecie(
                              title: 'Fruto',
                              body: widget.controller
                                  .informacoesEspeciesList[widget.id].fruto,
                              imageIcon: 'assets/icon-7.png',
                              color: Colors.lime.shade100,
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
