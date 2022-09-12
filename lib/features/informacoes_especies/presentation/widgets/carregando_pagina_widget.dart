import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class CarregandoPaginaWidget extends StatelessWidget {
  const CarregandoPaginaWidget({
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
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 200.00,
                      height: 200.00,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/bako_vetor.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Carregando',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Estamos preparando tudo para você descobrir uma nova especie!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
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