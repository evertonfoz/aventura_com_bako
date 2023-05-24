import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfiguracoesScreen extends StatefulWidget {
  ConfiguracoesScreen({super.key, required this.audioController});

  final AudioController audioController;
  @override
  State<ConfiguracoesScreen> createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opções'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: const BoxDecoration(color: Colors.green),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Volume',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Música:',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Slider(
                        activeColor: Colors.amber,
                        inactiveColor: Colors.amber[800],
                        value: widget.audioController.volumeBGM,
                        onChanged: (value) async {
                          setState(() {
                            widget.audioController.volumeBGM = value;
                            widget.audioController.playerBGM.setVolume(value);
                          });
                        }),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                '${(widget.audioController.volumeBGM * 100).toInt()}%'),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Falas:',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Slider(
                        activeColor: Colors.amber,
                        inactiveColor: Colors.amber[800],
                        value: widget.audioController.volumeFala,
                        onChanged: (value) async {
                          setState(() {
                            widget.audioController.volumeFala = value;
                            widget.audioController.playerFala.setVolume(value);
                          });
                        }),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                '${(widget.audioController.volumeFala * 100).toInt()}%'),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
