import 'package:aventura_com_bako/features/galeria/controller/galeria_controller.dart';
import 'package:aventura_com_bako/features/galeria/presentation/pages/Informacoes_especie_galeria.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  InformacoesGalleryController controller =
      Get.put(InformacoesGalleryController());

  @override
  void initState() {
    controller.getAllInformacoesEspecies();
    super.initState();
    reload();
  }

  reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bako_vetor.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Galeria',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        overflow: TextOverflow.clip),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bako_vetor.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: CupertinoScrollbar(
                thickness: 8,
                radiusWhileDragging: const Radius.circular(10),
                scrollbarOrientation: ScrollbarOrientation.right,
                radius: const Radius.circular(10),
                child: GridView.builder(
                  itemCount: controller.informacoesEspeciesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightGreen,
                              style: BorderStyle.solid,
                              width: 5),
                          borderRadius: BorderRadius.zero,
                          shape: BoxShape.rectangle,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                  '${controller.informacoesEspeciesList[index].assets}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InformacoesGalleryPage(
                                      controller: controller,
                                      id: index,
                                    )));
                      },
                    );
                  },
                ),
              )),
        ),
      ],
    ));
  }
}
