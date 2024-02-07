import 'package:audioplayers/audioplayers.dart';
import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/historia_bosque_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.user, required this.audioController})
      : super(key: key);

  final GamificationUser user;
  final AudioController audioController;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool audioIsPlaying = false;
  @override
  void initState() {
    widget.audioController.loadFalaWelcomePage();
    super.initState();
  }

  @override
  void dispose() {
    widget.audioController.playerFala.stop();
    super.dispose();
  }

  Future<bool?> showDialogFotoBosque() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.black,
          insetPadding: EdgeInsets.all(8.0),
          elevation: 8,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Bosque UTFPR Medianeira!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/images/BOSQUE.jpg'),
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: Colors.amber),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Voltar',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              backgroundColor: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.audioController.playerFala.onPlayerStateChanged.listen((state) {
      setState(() {
        audioIsPlaying = state == PlayerState.playing;
      });
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Passeio no bosque')),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/Inicial2_1080x1920.png'), //TODO Constantes
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.45,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Olá, ${widget.user.userName}!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'O bosque da UTFPR é um pequeno fragmento florestal de 5500 m2 que conta com mais de 350 indivíduos arbóreos de 61 espécies pertencentes à 26 famílias botânicas. Dentro do bosque, você poderá percorrer uma trilha que tem xx m onde 22 espécies receberam identificação. Vamos conhecê-las melhor?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Clique aqui:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.20,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  color: Colors.green,
                                  icon: const Image(
                                      image:
                                          AssetImage('assets/icons/map.png')),
                                  onPressed: () {
                                    showDialogFotoBosque();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/Bako_1281x1423.png'), //TODO Constantes
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.lightGreen,
                            border: Border.all(color: Colors.green, width: 5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.volume_up,
                              size: MediaQuery.of(context).size.width * 0.15,
                              color: Colors.white,
                            ),
                            FloatingActionButton(
                              heroTag: 'pauseWelcome',
                              onPressed: () async {
                                if (audioIsPlaying) {
                                  await widget.audioController.playerFala
                                      .pause();
                                } else {
                                  await widget.audioController.playerFala
                                      .resume();
                                }
                              },
                              child: Icon(
                                audioIsPlaying ? Icons.pause : Icons.play_arrow,
                                size: MediaQuery.of(context).size.width * 0.15,
                                // color: kBrandColor,
                              ),
                            ),
                          ],
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
                                    builder: (context) => HistoriaPage(
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
