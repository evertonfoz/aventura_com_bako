import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/botoes_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/joystick_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(
              game: mapa,
              overlayBuilderMap: {
                'BotoesPage': (BuildContext context, MapScreen mapa) =>
                    BotoesPage(
                      mapa: mapa,
                    )
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joystick(onDirectionChanged: onJoystickDirectionChanged),
              ),
            )
          ],
        ));
  }

  void onJoystickDirectionChanged(Direction direction) {
    mapa.onJoystickDirectionChanged(direction);
  }
}
