import 'package:aventura_com_bako/features/informacoes_especies/controllers/informacoes_controller.dart';
import 'package:aventura_com_bako/features/informacoes_especies/presentation/widgets/categoria_especie_widget.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesEspeciesPage extends StatefulWidget {
  const InformacoesEspeciesPage({Key? key}) : super(key: key);

  @override
  State<InformacoesEspeciesPage> createState() =>
      _InformacoesEspeciesPageState();
}

class _InformacoesEspeciesPageState extends State<InformacoesEspeciesPage> {
  InformacoesEspeciesController controller =
      Get.put(InformacoesEspeciesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 300,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linear,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                        child: Container(
                          width: 700,
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage('assets/${itemIndex + 1}.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 285),
              child: Container(
                decoration: BoxDecoration(
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
                        padding: EdgeInsets.only(right: 50),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.informacoes.value.nomeCientifico,
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
                              decoration: BoxDecoration(
                                image: new DecorationImage(
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
                        child: Divider(),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Família ${controller.informacoes.value.familia}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(
                              ColorUtils.hexToInt("#94BF36"),
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(500),
                                topRight: Radius.circular(500),
                                bottomLeft: Radius.circular(500),
                                bottomRight: Radius.circular(500),
                              ),
                              color: Colors.green[100],
                            ),
                            child: Text('x'),
                          ),
                          SizedBox(width: 5),
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
                      SizedBox(height: 10),
                      Text(
                        'Paineira, Paineira-rosa, Paina-de-seda, Barriguda, Sumaúma, Árvore-de-lã, Árvore-de-paina, Paineira-de-espinho.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),
                      CategoriaEspecie(
                        title: 'Fenologia',
                        body: controller.informacoes.value.fenologia,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Altura',
                        body: controller.informacoes.value.altura,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Copa',
                        body: controller.informacoes.value.copa,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Tronco',
                        body: controller.informacoes.value.tronco,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Flores',
                        body: controller.informacoes.value.flores,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Folhas',
                        body: controller.informacoes.value.folhas,
                        imageIcon: '',
                      ),
                      CategoriaEspecie(
                        title: 'Fruto',
                        body: controller.informacoes.value.fruto,
                        imageIcon: '',
                      ),
                    ],
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
