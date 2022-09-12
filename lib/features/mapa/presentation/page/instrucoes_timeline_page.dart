import 'package:basic_utils/basic_utils.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'mapa_main_page.dart';
import 'welcome_page.dart';

class InstrucoesTimelinePage extends StatefulWidget {
  const InstrucoesTimelinePage({Key? key}) : super(key: key);

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
                height: 120,
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
                        text: 'Sua aventura está prestes a começar',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      TextECA(
                        text: 'Mas antes, vamos à algumas orientações',
                        fontSize: 16,
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
                        'assets/bako_vetor.png'), //TODO Constantes
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 480.0, left: 140),
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
                padding: const EdgeInsets.only(top: 25, bottom: 25, left: 20),
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
                        '${textosDeInformacao[index]}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
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
                      builder: (context) => const MapPage(),
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

  var textosDeInformacao = [
    {'1. Texto de informação'},
    {'2. Texto de informação'},
    {'3. Texto de informação'},
  ];
}
