import 'package:aventura_com_bako/features/mapa/presentation/page/instrucoes_timeline_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              width: 300.00,
              height: 150.00,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage('assets/idv.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.00,
                height: 200.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/bako_vetor.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 20),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white60,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Olá, eu sou o Bako e vou te acompanhar nessa aventura!',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Pela nossa jornada, exploraremos a trilha do Bosque da UTFPR. A trilha do Bosque é um caminho de XXXXm e conta com 21 especies diferentes para desbravarmos. ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50),
            width: 220,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstrucoesTimelinePage(),
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
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Avançar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(
                          ColorUtils.hexToInt("#788A25"),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                      color: Color(
                        ColorUtils.hexToInt("#788A25"),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                      color: Color(
                        ColorUtils.hexToInt("#788A25"),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                      color: Color(
                        ColorUtils.hexToInt("#788A25"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
