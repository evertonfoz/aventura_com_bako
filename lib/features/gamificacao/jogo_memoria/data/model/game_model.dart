import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MemoryGameModel {
  final String hiddenCardPath = 'assets/hidden.png';
  List<String>? gameImg;
  List<String>? shuffleCardsList;
  final int cardCount = 12;

  final cardsList = [
    "assets/trofeu_icon.png",
    "assets/saco-de-sementes.png",
    "assets/icon-9.png",
    "assets/score_icon.png",
    "assets/plant_icon.png",
    "assets/Bako_1281x1423.png",
    //
    "assets/trofeu_icon.png",
    "assets/saco-de-sementes.png",
    "assets/icon-9.png",
    "assets/plant_icon.png",
    "assets/score_icon.png",
    "assets/Bako_1281x1423.png",
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
