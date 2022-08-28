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
import 'package:flutter/services.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  MapScreen mapa = MapScreen();
  late bool sair = false;

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
                    image: ExactAssetImage('assets/bako_vetor.png'),
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
            // TextButton(
            //   onPressed: () => Navigator.pop(context, false),
            //   child: Text('Cancelar'),
            // ),
            // TextButton(
            //   onPressed: () => Navigator.pop(context, true),
            //   child: Text('Sair'),
            // ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                    ),
                'QrCodePage': (BuildContext context, MapScreen mapa) {
                  return QrCodeScannerPage(mapa: mapa);
                },
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
                        InformacoesEspeciesPage(mapa: mapa),
                'DescobriuTodasEspeciesPage':
                    (BuildContext context, MapScreen mapa) =>
                        DescobriuTodasEspeciesPage(
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
