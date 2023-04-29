import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/presentation/controller/jogoMemoria_controller.dart';
import 'package:flutter/material.dart';

class InformacoesMemoriaPage extends StatefulWidget {
  InformacoesMemoriaPage(
      {required this.controller, required this.index, super.key});

  int index;
  InformacoesJogoDaMemoriaController controller;

  @override
  State<InformacoesMemoriaPage> createState() => _InformacoesMemoriaPageState();
}

class _InformacoesMemoriaPageState extends State<InformacoesMemoriaPage> {
  test() {
    print(widget.controller.informacoesJogoDaMemoriaList[widget.index].assets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              onPressed: () {
                test();
              },
            ),
          ),

          /*Text(widget.controller.informacoesJogoDaMemoriaList[widget.idex]
                  .titulo ??
              'oi'),*/
        ],
      ),
    );
  }
}
