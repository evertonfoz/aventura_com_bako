import 'package:audioplayers/audioplayers.dart';

class AudioController {
  final playerBGMCache = AudioCache();
  final playerBGM = AudioPlayer();
  final playerFalaCache = AudioCache();
  final playerFala = AudioPlayer();
  double volumeFala = 1.0;
  double volumeBGM = 1.0;

  playBGM() async {
    playerBGM.setReleaseMode(ReleaseMode.LOOP);
    final url = await playerBGMCache.load('audio/bgm1.mp3');
    playerBGM.setUrl(url.path, isLocal: true);
    await playerBGM.resume();
  }

  playFalaWelcomePage() async {
    final url = await playerFalaCache.load('audio/falaMapaWelcomePage.mp3');
    playerFala.setUrl(url.path, isLocal: true);
    await playerFala.resume();
  }
}
