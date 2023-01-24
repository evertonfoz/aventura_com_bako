import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

import '../../../mapa/presentation/page/mapa_screen.dart';

class EspecieErradaPage extends StatelessWidget {
  final MapScreen mapa;

  const EspecieErradaPage({
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
                        image: ExactAssetImage('assets/bako_vetor.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const Text(
                    'Ops!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Parece que a espécie que você está tendo ler, não pertence ao '
                    'ponto em que você está! Tente novamente.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 50, top: 20),
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        mapa.overlays.remove('EspecieErradaPage');
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
