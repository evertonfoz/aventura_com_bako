import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final GamificationUser gamificationUser = GamificationUser();
  final audioPlayer = AudioController();
  bool _validate = false;
  bool muteBGM = false;
  bool muteFala = false;
  @override
  void initState() {
    super.initState();
    audioPlayer.playBGM1();
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        if (!muteBGM) {
                          setState(() {
                            muteBGM = true;
                            audioPlayer.volumeBGM = 0;
                            audioPlayer.playerBGM.setVolume(0);
                          });
                        } else {
                          setState(() {
                            muteBGM = false;
                            audioPlayer.volumeBGM = 1;
                            audioPlayer.playerBGM.setVolume(1);
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Icon(muteBGM ? Icons.music_note : Icons.music_off),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        if (!muteFala) {
                          setState(() {
                            muteFala = true;
                            audioPlayer.volumeFala = 0;
                            audioPlayer.playerFala.setVolume(0);
                          });
                        } else {
                          setState(() {
                            muteFala = false;
                            audioPlayer.volumeFala = 1;
                            audioPlayer.playerFala.setVolume(1);
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Icon(muteFala ? Icons.volume_up : Icons.volume_off),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.38,
                  decoration: ShapeDecoration(
                    color: Colors.yellow,
                    shape: TooltipShapeBorder(
                      arrowArc: 0.5,
                      arrowHeight: 35,
                    ),
                    shadows: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(2, 2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Olá, eu sou o Bako e vou te acompanhar nessa aventura!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Letters_for_leaners',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Antes de nós iniciarmos nossa aventura. Como você gostaria de ser chamado?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Letters_for_leaners',
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                  autofocus: false,
                                  maxLength: 20,
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    labelText: 'Digite seu nome aqui',
                                    labelStyle:
                                        const TextStyle(color: Colors.green),
                                    errorText: _validate
                                        ? 'Campo não pode estar vazio'
                                        : null,
                                    errorStyle: const TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  )),
                            ),
                            Expanded(
                                child: FloatingActionButton(
                              onPressed: () {
                                if (usernameController.text.isNotEmpty) {
                                  gamificationUser.userName =
                                      usernameController.text;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                                audioController: audioPlayer,
                                                user: gamificationUser,
                                              )));
                                } else {
                                  setState(() {
                                    _validate = true;
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.check,
                                size: 35,
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 270.00,
                  height: 270.00,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/Bako_1281x1423.png'), //TODO Constantes
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/idv.png',
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(
        rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(
          -x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
