import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/instrucoes_timeline_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.user, required this.audioController})
      : super(key: key);

  GamificationUser user;
  AudioController audioController;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool audioIsPlaying = true;
  @override
  void initState() {
    widget.audioController.playFalaWelcomePage();
    super.initState();
  }

  @override
  void dispose() {
    widget.audioController.playerFala.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.audioController.playerFala.onPlayerStateChanged.listen((state) {
      setState(() {
        audioIsPlaying = state == PlayerState.PLAYING;
      });
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Passeio no bosque')),
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
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            ExactAssetImage('assets/idv.png'), //TODO Constantes
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.30,
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
                        Text(
                          'Olá, ${widget.user.userName}!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Letters_for_leaners',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Pela nossa jornada, exploraremos a trilha do Bosque da UTFPR. A trilha do Bosque é um caminho de XXXXm e conta com 21 espécies diferentes para desbravarmos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Letters_for_leaners',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 250.00,
                  height: 250.00,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/Bako_1281x1423.png'), //TODO Constantes
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: FloatingActionButton(
                      heroTag: 'pauseWelcome',
                      onPressed: () async {
                        if (audioIsPlaying) {
                          await widget.audioController.playerFala.pause();
                        } else {
                          await widget.audioController.playerFala.resume();
                        }
                      },
                      child: Icon(
                        audioIsPlaying ? Icons.pause : Icons.play_arrow,
                        size: 60,
                        // color: kBrandColor,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: FloatingActionButton(
                      heroTag: 'instrucoes',
                      onPressed: () {
                        widget.audioController.playerFala.pause();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstrucoesTimelinePage(
                              user: widget.user,
                              audioController: widget.audioController,
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 60,
                        // color: kBrandColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
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
