import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

import '../../../mapa/presentation/page/mapa_screen.dart';

class EspecieRepetidaPage extends StatelessWidget {
  final MapScreen mapa;

  const EspecieRepetidaPage({
    required this.mapa,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: ExactAssetImage('assets/Padrão4.jpg'),
          fit: BoxFit.fitHeight,
        ),
        color: Color(
          ColorUtils.hexToInt("#94BF36"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white60,
              ),
              child: Column(
                children: [
                  Container(
                    width: 200.00,
                    height: 200.00,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/Bako_1281x1423.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const Text(
                    'Ops!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Lembre-se, você só pode descobrir uma especie uma unica vez! Tente descobrir uma nova.',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        mapa.overlays.remove('EspecieRepetidaPage');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Color(
                          ColorUtils.hexToInt("#FEE784"),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'Retomar',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
