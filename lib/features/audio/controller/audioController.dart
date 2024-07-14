import 'package:audioplayers/audioplayers.dart';

class AudioController {
  final playerBGMCache = AudioCache();
  final playerBGM = AudioPlayer();
  final playerFalaCache = AudioCache();
  final playerFala = AudioPlayer();
  final playerSFXCache = AudioCache();
  final playerSFX = AudioPlayer();
  double volumeFala = 1.0;
  double volumeSFX = 1.0;
  double volumeBGM = 1.0;

  playBGM1() async {
    playerBGM.setReleaseMode(ReleaseMode.LOOP);
    final url = await playerBGMCache.load('audio/bgm1.mp3');
    playerBGM.setUrl(url.path);
    await playerBGM.resume();
  }

  pauseBGM() async {
    await playerBGM.pause();
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
    final url = await playerSFXCache.load('audio/diceRoll.mp3');
    playerSFX.setUrl(url.path);
    playerSFX.resume();
  }

  playMatchCardAudio() async {
    final url = await playerSFXCache.load('audio/match_sfx.mp3');
    playerSFX.setUrl(url.path);
    playerSFX.resume();
  }
}
