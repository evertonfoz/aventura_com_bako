import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class BotoesPage extends StatelessWidget {
  final MapScreen mapa;
  const BotoesPage({Key? key, required this.mapa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white60,
        ),
        child: Column(
          children: [
            Text('Placar:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/score_icon.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Text(
                  '${mapa.placar}/21',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        ColorUtils.hexToInt("#94BF36"),
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
