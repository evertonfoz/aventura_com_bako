import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'mapa_main_page.dart';
import 'welcome_page.dart';

class InstrucoesTimelinePage extends StatefulWidget {
  InstrucoesTimelinePage({Key? key, required this.user}) : super(key: key);

  GamificationUser user;
  @override
  State<InstrucoesTimelinePage> createState() => _InstrucoesTimelinePageState();
}

class _InstrucoesTimelinePageState extends State<InstrucoesTimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 300.00,
            height: 150.00,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/idv.png'), //TODO Constantes
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.20,
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
                    children: const [
                      Text(
                        'Sua aventura está prestes a começar',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Mas antes, vamos à algumas orientações',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 200.00,
                height: 200.00,
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
        Padding(
          padding: const EdgeInsets.only(top: 480.0, left: 40),
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0,
              indicatorTheme: IndicatorThemeData(
                size: 20,
                color: Color(
                  ColorUtils.hexToInt("#FEE784"),
                ),
              ),
              connectorTheme: ConnectorThemeData(
                color: Color(
                  ColorUtils.hexToInt("#FEE784"),
                ),
                space: 30.0,
                thickness: 5.0,
                indent: 0,
              ),
            ),
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 5, left: 20, right: 100),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white60,
                  ),
                  child: Column(
                    children: [
                      Text(
                        textosDeInformacao[index],
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: textosDeInformacao.length,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPage(user: widget.user),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward,
                  size: 60,
                  // color: kBrandColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  List<String> textosDeInformacao = [
    '1. Toque no botão abaixo para começar',
    '2. Utilize o controle para caminhar para os lados, frente e trás',
    '3. Ao chegar em uma árvore, será aberta a câmera para você apontar para o QR Code',
  ];
}
