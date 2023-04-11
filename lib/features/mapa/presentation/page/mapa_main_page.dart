import 'package:aventura_com_bako/features/informacoes_especies/presentation/pages/especie_errada_page.dart';

import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';

import 'package:aventura_com_bako/features/informacoes_especies/presentation/pages/infomacoes_especies_page.dart';
import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/botoes_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/descobriu_todas_as_especies_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/joystick_widget.dart';
import 'package:aventura_com_bako/features/qrcode/presentation/pages/qrcode_scanner_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../informacoes_especies/presentation/controller/informacoes_controller.dart';
import '../../../informacoes_especies/presentation/pages/especie_repetida_page.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, required this.user}) : super(key: key);

  GamificationUser user = GamificationUser();
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  MapScreen mapa = MapScreen();
  GamificationUser gamification = GamificationUser();
  late bool sair = false;
  InformacoesEspeciesController informacoesEspeciesController =
      Get.put(InformacoesEspeciesController());

  @override
  void initState() {
    super.initState();
    informacoesEspeciesController.getAllInformacoesEspecies();
  }

  Future<bool?> showDialogSairDoMapa() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          elevation: 8,
          title: Text(
            'Você deseja mesmo sair do mapa?',
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
                  'Ao sair agora, você perderá o progresso pela trilha.',
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Color(
                    ColorUtils.hexToInt("#FEE784"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(
                        ColorUtils.hexToInt("#788A25"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Color(
                    ColorUtils.hexToInt("#FEE784"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Sair',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(
                        ColorUtils.hexToInt("#788A25"),
                      ),
                    ),
                  ),
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
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WillPopScope(
      onWillPop: () async {
        final sair = await showDialogSairDoMapa();
        return sair ?? false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(
              game: mapa,
              overlayBuilderMap: {
                'BotoesPage': (BuildContext context, MapScreen mapa) =>
                    BotoesPage(
                      mapa: mapa,
                      gamification: gamification,
                    ),
                'QrCodePage': (BuildContext context, MapScreen mapa) =>
                    QrCodeScannerPage(mapa: mapa, user: widget.user,),
                'JoyStick': (BuildContext context, MapScreen mapa) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Joystick(
                              onDirectionChanged: onJoystickDirectionChanged),
                        ),
                      ),
                    ),
                'InformacoesEspeciesPage':
                    (BuildContext context, MapScreen mapa) =>
                        InformacoesEspeciesPage(
                            mapa: mapa, gamification: gamification),
                'DescobriuTodasEspeciesPage':
                    (BuildContext context, MapScreen mapa) =>
                        DescobriuTodasEspeciesPage(
                          mapa: mapa,
                        ),
                'EspecieErradaPage': (BuildContext context, MapScreen mapa) =>
                    EspecieErradaPage(
                      mapa: mapa,
                    ),
                'EspecieRepetidaPage': (BuildContext context, MapScreen mapa) =>
                    EspecieRepetidaPage(
                      mapa: mapa,
                    ),
              },
            ),
          ],
        ),
      ),
    );
  }

  void onJoystickDirectionChanged(Direction direction) {
    mapa.onJoystickDirectionChanged(direction);
  }
}
