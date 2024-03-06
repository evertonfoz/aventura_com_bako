import 'package:audioplayers/audioplayers.dart';

class AudioController {
  final playerBGMCache = AudioCache();
  final playerBGM = AudioPlayer();
  final playerFalaCache = AudioCache();
  final playerFala = AudioPlayer();
  double volumeFala = 1.0;
  double volumeBGM = 1.0;

  playBGM1() async {
    playerBGM.setReleaseMode(ReleaseMode.LOOP);
    final url = await playerBGMCache.load('audio/bgm1.mp3');
    playerBGM.setUrl(url.path);
    await playerBGM.resume();
  }

  playBGM2() async {
    playerBGM.setReleaseMode(ReleaseMode.LOOP);
    final url = await playerBGMCache.load('audio/bgm2.mp3');
    playerBGM.setUrl(url.path);
    await playerBGM.resume();
  }

  loadFalaWelcomePage() async {
    final url = await playerFalaCache.load('audio/falaMapaWelcomePage.mp3');
    playerFala.setUrl(url.path);
  }

  loadFalaHistoria() async {}

  loadFalaInstrucoesPage() async {
    final url = await playerFalaCache.load('audio/falaMapaInstrucoesPage.mp3');
    playerFala.setUrl(url.path);
  }

  loadFalaFromJson(String urlFromJson) async {
    final url = await playerFalaCache.load(urlFromJson);
    playerFala.setUrl(url.path);
  }

  playDiceAudio() async {
    final url = await playerFalaCache.load('audio/diceRoll.mp3');
    playerFala.setUrl(url.path);
    playerFala.resume();
  }
}
