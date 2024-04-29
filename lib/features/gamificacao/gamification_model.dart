class GamificationUser {
  String userName = '';
  int pontuacao = 0;
  List<bool> itensLoja = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> especieDescoberta = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true
  ];

  void updatePontuacao(int pontos) {
    pontuacao += pontos;
  }
}
