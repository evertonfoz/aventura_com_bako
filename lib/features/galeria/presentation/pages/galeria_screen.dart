import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/galeria/controller/galeria_controller.dart';
import 'package:aventura_com_bako/features/galeria/presentation/pages/Informacoes_especie_galeria.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GalleryScreen extends StatefulWidget {
  GalleryScreen({required this.user, required this.audioController, Key? key})
      : super(key: key);

  GamificationUser user;
  AudioController audioController;
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
  }

  Future<bool?> showDialogEspecieNaoEncontrada() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          elevation: 8,
          title: Text(
            'Você ainda não descobriu essa espécie!',
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Row(
            children: [
              Container(
                width: 70.00,
                height: 70.00,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/Bako.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Se deseja aprender mais sobre essa espécie vá até o bosque e procure o QRcode.',
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
              ),
            ],
          ),
          actions: [
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {});
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Galeria'),
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                  child: CupertinoScrollbar(
                    thickness: 8,
                    radiusWhileDragging: const Radius.circular(10),
                    scrollbarOrientation: ScrollbarOrientation.right,
                    radius: const Radius.circular(20),
                    child: GridView.builder(
                      itemCount: controller.informacoesEspeciesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) {
                        return RawMaterialButton(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.lightGreen,
                                  style: BorderStyle.solid,
                                  width: 5),
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  color: Colors.black87,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                )
                              ],
                              image: DecorationImage(
                                  image: AssetImage(
                                      '${widget.user.especieDescoberta[index] ? controller.informacoesEspeciesList[index].assets : 'assets/hidden.png'}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          onPressed: () {
                            if (widget.user.especieDescoberta[index]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformacoesGalleryPage(
                                            audioController:
                                                widget.audioController,
                                            controller: controller,
                                            id: index,
                                          )));
                            } else {
                              showDialogEspecieNaoEncontrada();
                            }
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
