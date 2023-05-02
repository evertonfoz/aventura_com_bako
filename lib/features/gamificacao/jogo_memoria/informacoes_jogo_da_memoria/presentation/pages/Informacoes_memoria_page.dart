import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/presentation/controller/jogoMemoria_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../mapa/presentation/page/welcome_page.dart';

class InformacoesMemoriaPage extends StatefulWidget {
  InformacoesMemoriaPage(
      {required this.controller, required this.index, super.key});

  int index;
  InformacoesJogoDaMemoriaController controller;

  @override
  State<InformacoesMemoriaPage> createState() => _InformacoesMemoriaPageState();
}

class _InformacoesMemoriaPageState extends State<InformacoesMemoriaPage> {
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
                  image:
                      ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.controller.informacoesJogoDaMemoriaList[widget.index]
                          .titulo ??
                      '--',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.yellow,
                      shape: TooltipShapeBorder(
                        arrowArc: 0.5,
                        arrowHeight: 20,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.green,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black87,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                                image: DecorationImage(
                                    image: AssetImage(widget
                                            .controller
                                            .informacoesJogoDaMemoriaList[
                                                widget.index]
                                            .assets ??
                                        'assets/hidden.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Text(
                            widget
                                    .controller
                                    .informacoesJogoDaMemoriaList[widget.index]
                                    .texto ??
                                '--',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  //width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/Bako_1281x1423.png'), //TODO Constantes
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       color: Colors.green,
                //       boxShadow: <BoxShadow>[
                //         BoxShadow(
                //           color: Colors.green,
                //           blurRadius: 1.0,
                //           spreadRadius: 3.0,
                //         )
                //       ],
                //     ),
                //     child: Text(
                //       widget
                //               .controller
                //               .informacoesJogoDaMemoriaList[widget.index]
                //               .texto ??
                //           '--',
                //       style: TextStyle(color: Colors.white),
                //       textAlign: TextAlign.justify,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    child:
                        const Text('Continuar', style: TextStyle(fontSize: 30)),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
          )
        ],
      ),
    );
  }
}
