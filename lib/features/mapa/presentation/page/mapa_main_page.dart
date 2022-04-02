import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/mapa/widgets/joystick_widget.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  MapScreen mapa = MapScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(game: mapa),
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
