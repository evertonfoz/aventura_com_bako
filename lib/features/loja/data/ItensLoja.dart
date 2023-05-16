import 'package:aventura_com_bako/features/audio/controller/audioController.dart';

abstract class ItemLoja {
  final String asset, title, desc;
  final int id, price;
  bool active = false, bought = false;
  ItemLoja(this.id, this.title, this.price, this.asset, this.desc);
}

class BGM2 extends ItemLoja {
  BGM2(super.id, super.title, super.price, super.asset, super.desc);
  metodo() {}
}

class Item2 extends ItemLoja {
  Item2(super.id, super.title, super.price, super.asset, super.desc);
  metodo() {}
}

class Item3 extends ItemLoja {
  Item3(super.id, super.title, super.price, super.asset, super.desc);
  metodo() {}
}

class Item4 extends ItemLoja {
  Item4(super.id, super.title, super.price, super.asset, super.desc);
  metodo() {}
}

class Item5 extends ItemLoja {
  Item5(super.id, super.title, super.price, super.asset, super.desc);
  metodo() {}
}

List<ItemLoja> itensLoja = [
  BGM2(0, 'Musica', 30, 'assets/images/notamusical.png',
      'Nova musica de fundo!'),
  Item2(1, 'titulo 2', 30, 'assets/hidden.png', 'desc 2'),
  Item3(2, 'titulo 3', 30, 'assets/hidden.png', 'desc 3'),
  Item4(3, 'titulo 4', 30, 'assets/hidden.png', 'desc 4'),
  Item5(4, 'titulo 5', 30, 'assets/hidden.png', 'desc 5'),
];
