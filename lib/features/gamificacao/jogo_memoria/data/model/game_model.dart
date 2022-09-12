import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MemoryGameModel {
  final String hiddenCardPath = 'assets/images/hidden.png';
  List<String>? gameImg;
  final int cardCount = 12;

  final List<String> cardsList = [
    "assets/games/jogo_memoria/circle.png",
    "assets/games/jogo_memoria/heart.png",
    "assets/games/jogo_memoria/star.png",
    "assets/games/jogo_memoria/triangle.png",
    "assets/games/jogo_memoria/circle.png",
    "assets/games/jogo_memoria/heart.png",
    "assets/games/jogo_memoria/star.png",
    "assets/games/jogo_memoria/triangle.png",
    "assets/games/jogo_memoria/circle.png",
    "assets/games/jogo_memoria/heart.png",
    "assets/games/jogo_memoria/star.png",
    "assets/games/jogo_memoria/triangle.png",
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
  ];

  List<Map<int, String>> matchCheck = [];

  //init Game
  void initGame() {
    cardsList.shuffle();
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
