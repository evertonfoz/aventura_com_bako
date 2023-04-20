import 'package:aventura_com_bako/features/home/presentation/pages/home_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class DescobriuTodasEspeciesPage extends StatefulWidget {
  const DescobriuTodasEspeciesPage({Key? key, required this.mapa})
      : super(key: key);

  final MapScreen mapa;

  @override
  State<DescobriuTodasEspeciesPage> createState() =>
      _DescobriuTodasEspeciesPageState();
}

class _DescobriuTodasEspeciesPageState
    extends State<DescobriuTodasEspeciesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(top: 20),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(
                    ColorUtils.hexToInt("#FEE784"),
                  ),
                  border: Border.all(width: 0.5, color: Colors.grey.shade500),
                ),
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: Color(
                      ColorUtils.hexToInt("#788A25"),
                    ),
                  ),
                  onTap: () {
                    widget.mapa.overlays.remove('DescobriuTodasEspeciesPage');
                    // widget.mapa.overlays.notifyListeners();
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                width: 200.00,
                height: 100.00,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/idv.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white60,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Parabéns!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      width: 200.00,
                      height: 200.00,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/trofeu_icon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const Text(
                      'Você descobriu todas as espécies!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Center(
                          child: Container(
                            width: 70.00,
                            height: 70.00,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage('assets/bako_vetor.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'Agora, você conhece todas as espécies que temos em nosso Bosque.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 50, top: 20),
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                      'Encerrar a trilha',
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
    );
  }
}
