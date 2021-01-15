class Pagination {
  final String cardText;
  final String imageUrl;

  Pagination({this.imageUrl, this.cardText});
}

final cardList = [
  Pagination(
    imageUrl: '',
    cardText:
        'Olá! Eu me chamo Bako, e vou contigo através dessa aventura. Vou te ensinar como jogar e explorar ao máximo nossa jornada!',
  ),
  Pagination(
    imageUrl: 'assets/icons/map.png',
    cardText:
        'Encontre tesouros, descura novas espécies e ganhe pontos durante todo o percurso da trilha',
  ),
  Pagination(
    imageUrl: 'assets/icons/game.png',
    cardText:
        'Ganhe pontos descobrindo dicas durante o passeio e ainda resolva os mistérios da nossa aventura',
  ),
  Pagination(
    imageUrl: 'assets/icons/book.png',
    cardText: 'Conheça mais sobre o bosque e suas curiosidades e aprenda',
  ),
  Pagination(
    imageUrl: 'assets/icons/qr_code.png',
    cardText:
        'Com a câmera do seu celular, você consegue escanear as placas pelo bosque e participar dos desafios',
  ),
  Pagination(
    imageUrl: 'assets/icons/ready.png',
    cardText: 'VAMOS COMEÇAR?',
  )
];
