import 'package:audioplayers/audioplayers.dart';

class AudioController {
  final playerBGMCache = AudioCache();
  final playerBGM = AudioPlayer();
  final playerFalaCache = AudioCache();
  final playerFala = AudioPlayer();
  double volumeFala = 1.0;
  double volumeBGM = 1.0;

  playBGM1() async {
    playerBGM.setReleaseMode(ReleaseMode.loop);
    final url = await playerBGMCache.load('audio/bgm1.mp3');
    playerBGM.setSourceUrl(url.path);
    await playerBGM.resume();
  }

  playBGM2() async {
    playerBGM.setReleaseMode(ReleaseMode.loop);
    final url = await playerBGMCache.load('audio/bgm2.mp3');
    playerBGM.setSourceUrl(url.path);
    await playerBGM.resume();
  }

  loadFalaWelcomePage() async {
    final url = await playerFalaCache.load('audio/falaMapaWelcomePage.mp3');
    playerFala.setSourceUrl(url.path);
  }

  loadFalaHistoria() async {}

  loadFalaInstrucoesPage() async {
    final url = await playerFalaCache.load('audio/falaMapaInstrucoesPage.mp3');
    playerFala.setSourceUrl(url.path);
  }

  loadFalaFromJson(String urlFromJson) async {
    final url = await playerFalaCache.load(urlFromJson);
    playerFala.setSourceUrl(url.path);
  }

  playDiceAudio() async {
    final url = await playerFalaCache.load('audio/diceRoll.mp3');
    playerFala.setSourceUrl(url.path);
    playerFala.resume();
  }
}
