import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MemoryGameModelEasy {
  final String hiddenCardPath = 'assets/hidden.png';
  List<String>? gameImg;
  List<String>? shuffleCardsList;
  final int cardCount = 12;

  final cardsList = [
    "assets/games/Memoria/abelha.png",
    "assets/games/Memoria/agua.png",
    "assets/games/Memoria/BEIJAFLOR.png",
    "assets/games/Memoria/bosque.png",
    "assets/games/Memoria/cactos.png",
    "assets/games/Memoria/cipo.png",
    //
    "assets/games/Memoria/abelha.png",
    "assets/games/Memoria/agua.png",
    "assets/games/Memoria/BEIJAFLOR.png",
    "assets/games/Memoria/bosque.png",
    "assets/games/Memoria/cactos.png",
    "assets/games/Memoria/cipo.png",
  ];

  List<GlobalKey<FlipCardState>> cardStateKeys = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];

  List<bool> cardFlips = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<Map<int, String>> matchCheck = [];

  //init Game
  void initGame() {
    shuffleCardsList = List.from(cardsList);
    shuffleCardsList!.shuffle();
    cardStateKeys;
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}

class MemoryGameModelHard {
  final String hiddenCardPath = 'assets/hidden.png';
  List<String>? gameImg;
  List<String>? shuffleCardsList;
  final int cardCount = 20;

  final cardsList = [
    "assets/games/Memoria/epifita.png",
    "assets/games/Memoria/ervdepassarinho.png",
    "assets/games/Memoria/folhas de manga.png",
    "assets/games/Memoria/frutomanga.png",
    "assets/games/Memoria/fungo.jpeg",
    "assets/games/Memoria/hibisco.png",
    "assets/games/Memoria/morgueso.png",
    "assets/games/Memoria/sementeauracauria.png",
    "assets/games/Memoria/serra.png",
    "assets/games/Memoria/solo.png",
    //
    "assets/games/Memoria/epifita.png",
    "assets/games/Memoria/ervdepassarinho.png",
    "assets/games/Memoria/folhas de manga.png",
    "assets/games/Memoria/frutomanga.png",
    "assets/games/Memoria/fungo.jpeg",
    "assets/games/Memoria/hibisco.png",
    "assets/games/Memoria/morgueso.png",
    "assets/games/Memoria/sementeauracauria.png",
    "assets/games/Memoria/serra.png",
    "assets/games/Memoria/solo.png",
  ];

  List<GlobalKey<FlipCardState>> cardStateKeys = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];

  List<bool> cardFlips = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<Map<int, String>> matchCheck = [];

  //init Game
  void initGame() {
    shuffleCardsList = List.from(cardsList);
    shuffleCardsList!.shuffle();
    cardStateKeys;
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
