import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MemoryGameModel {
  final String hiddenCardPath = 'assets/hidden.png';
  List<String>? gameImg;
  final int cardCount = 12;

  final List<String> cardsList = [
    "assets/saco-de-sementes.png",
    "assets/plant_icon.png",
    "assets/score_icon.png",
    "assets/Bako_1281x1423.png",
    "assets/saco-de-sementes.png",
    "assets/plant_icon.png",
    "assets/score_icon.png",
    "assets/Bako_1281x1423.png",
    "assets/saco-de-sementes.png",
    "assets/plant_icon.png",
    "assets/saco-de-sementes.png",
    "assets/plant_icon.png",
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
    cardsList.shuffle();
    cardStateKeys;
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
