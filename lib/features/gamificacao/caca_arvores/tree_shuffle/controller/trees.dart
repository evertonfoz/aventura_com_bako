import 'dart:math';

import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class Trees {
  List<Tree> trees = List.empty(growable: true);

  Trees() {
    //Manga
    trees.add(Tree(
        macAddress: 'D5:E7:73:9A:61:59',
        popularName: 'Mangueira',
        scienceName: "Mangifera indica",
        tips: [
          "É uma espécie de planta da família Anacardiaceae",
          "Nativa nas florestas do sul e sudeste da Ásia",
          "Produz o fruto conhecido como manga"
        ],
        image: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/4/44/Mangifera_indica._Tropical_Brazil.JPG')));
    //Graviola
    trees.add(Tree(
        macAddress: 'DE:AB:8F:91:D4:76',
        popularName: 'Graviola',
        scienceName: "Annona muricata",
        tips: [
          "Planta originária das Antilhas",
          "Adaptada a áreas de alta umidade",
          "O sabor de seu fruto foi descrito como uma combinação de morango e maçã, com sensações cítrico azeda com um aroma semelhante ao abacaxi"
        ],
        image: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Annona_muricata_Blanco1.196.png/800px-Annona_muricata_Blanco1.196.png')));
  }

  Tree shuffle([List<Tree>? trees]) {
    List<Tree> _trees = List<Tree>.from(this.trees);
    print("Lista orignal:");
    printTree(_trees);
    if (trees != null) {
      print("Lista de arvores para remover:");
      printTree(trees);
      trees.forEach((treeChoiced) {
        _trees.removeWhere((tree) => tree.macAddress == treeChoiced.macAddress);
      });
    }
    if (_trees.isEmpty) {
      return Tree();
    }
    print("Lista nova:");
    printTree(_trees);
    Tree _a = _trees[Random().nextInt(_trees.length)];
    print(_a.popularName);
    return _a;
  }

  printTree(trees) {
    trees.forEach((tree) {
      print("Arvore: ${tree.popularName}");
    });
  }
}
