class ItemLoja {
  final String asset, title, desc;
  final int id, price;
  bool active = false;
  ItemLoja(this.id, this.title, this.price, this.asset, this.desc);
}

List<ItemLoja> itensLoja = [
  ItemLoja(0, 'titulo 1', 30, 'assets/hidden.png', 'desc 1'),
  ItemLoja(1, 'titulo 2', 30, 'assets/hidden.png', 'desc 2'),
  ItemLoja(2, 'titulo 3', 30, 'assets/hidden.png', 'desc 3'),
  ItemLoja(3, 'titulo 4', 30, 'assets/hidden.png', 'desc 4'),
  ItemLoja(4, 'titulo 5', 30, 'assets/hidden.png', 'desc 5'),
];
