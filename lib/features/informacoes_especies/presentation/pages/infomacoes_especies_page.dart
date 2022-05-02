import 'package:aventura_com_bako/features/informacoes_especies/presentation/controller/informacoes_controller.dart';
import 'package:aventura_com_bako/features/informacoes_especies/presentation/widgets/categoria_especie_widget.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesEspeciesPage extends StatefulWidget {
  const InformacoesEspeciesPage({Key? key, required this.valorLido})
      : super(key: key);

  final String valorLido;

  @override
  State<InformacoesEspeciesPage> createState() =>
      _InformacoesEspeciesPageState();
}

class _InformacoesEspeciesPageState extends State<InformacoesEspeciesPage> {
  InformacoesEspeciesController controller =
      Get.put(InformacoesEspeciesController());

  @override
  void initState() {
    controller.valorQrCode.value = widget.valorLido;
    getInformacoes();
    super.initState();
  }

  getInformacoes() async {
    await controller.getAllInformacoesEspecies();
    await controller.getInformacaoEspecieLida();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.buscandoEspecieLida.value) {
          return Text('Carregando');
        }
        return SingleChildScrollView(
          child: Stack(
            children: [
              // Container(
              //   child: CarouselSlider.builder(
              //     options: CarouselOptions(
              //       height: 300,
              //       aspectRatio: 16 / 9,
              //       viewportFraction: 1.0,
              //       initialPage: 0,
              //       enableInfiniteScroll: true,
              //       reverse: false,
              //       autoPlay: true,
              //       autoPlayInterval: Duration(seconds: 3),
              //       autoPlayAnimationDuration: Duration(milliseconds: 800),
              //       autoPlayCurve: Curves.linear,
              //       scrollDirection: Axis.horizontal,
              //     ),
              //     itemCount: controller.especieLida.value.assets?.length,
              //     itemBuilder: (BuildContext context, int itemIndex,
              //             int pageViewIndex) =>
              //         Container(
              //       child: Container(
              //         width: 700,
              //         decoration: BoxDecoration(
              //           image: new DecorationImage(
              //             image: AssetImage(
              //               '${controller.especieLida.value.assets?[itemIndex].url}',
              //             ),
              //             fit: BoxFit.fitHeight,
              //           ),
              //           color: Colors.transparent,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
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
                                '${controller.especieLida.value.idEspecie}',
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
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(500),
                                  topRight: Radius.circular(500),
                                  bottomLeft: Radius.circular(500),
                                  bottomRight: Radius.circular(500),
                                ),
                                image: new DecorationImage(
                                  image: AssetImage('assets/icon-1.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                                color: Colors.yellow[200],
                              ),
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
                          '${controller.especieLida.value.nomesPopulares}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                        CategoriaEspecie(
                          title: 'Fenologia',
                          body: controller.especieLida.value.fenologia,
                          imageIcon: 'assets/icon-4.png',
                          color: Colors.cyan.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Altura',
                          body: controller.especieLida.value.altura,
                          imageIcon: 'assets/icon-8.png',
                          color: Colors.pink.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Copa',
                          body: controller.especieLida.value.copa,
                          imageIcon: 'assets/icon-2.png',
                          color: Colors.green.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Tronco',
                          body: controller.especieLida.value.tronco,
                          imageIcon: 'assets/icon-3.png',
                          color: Colors.orange.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Flores',
                          body: controller.especieLida.value.flores,
                          imageIcon: 'assets/icon-6.png',
                          color: Colors.red.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Folhas',
                          body: controller.especieLida.value.folhas,
                          imageIcon: 'assets/icon-5.png',
                          color: Colors.teal.shade100,
                        ),
                        CategoriaEspecie(
                          title: 'Fruto',
                          body: controller.especieLida.value.fruto,
                          imageIcon: 'assets/icon-7.png',
                          color: Colors.lime.shade100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
