import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_main_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class InstrucoesTimelinePage extends StatefulWidget {
  @override
  State<InstrucoesTimelinePage> createState() => _InstrucoesTimelinePageState();
}

class _InstrucoesTimelinePageState extends State<InstrucoesTimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: ExactAssetImage('assets/Padrão4.jpg'),
            fit: BoxFit.fitHeight,
          ),
          color: Color(
            ColorUtils.hexToInt("#94BF36"),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    width: 200.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/idv.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sua aventura está prestes a começar...',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Mas antes, algumas instruções!',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 50),
                SizedBox(
                  height: 500,
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
                            top: 25, bottom: 25, left: 20),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white60,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${textosDeInformacao[index]}',
                                style: TextStyle(
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
                Center(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 50, top: 20),
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Color(
                          ColorUtils.hexToInt("#FEE784"),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'Iniciar a trilha',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(
                              ColorUtils.hexToInt("#788A25"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var textosDeInformacao = [
    {'1. Texto de informação'},
    {'2. Texto de informação'},
    {'3. Texto de informação'},
    {'4. Texto de informação'},
    {'5. Texto de informação'},
    {'6. Texto de informação'}
  ];
}
