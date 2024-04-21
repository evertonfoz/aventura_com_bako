import 'package:flutter/material.dart';

class Tree {
  String macAddress;
  String popularName;
  String scienceName;
  List<String> tips;
  Image? image;

  Tree(
      {this.macAddress = 'defaultMacAddress',
      this.popularName = 'defaultPopularName',
      this.scienceName = 'defaultScienceName',
      this.tips = const [],
      this.image});
}
