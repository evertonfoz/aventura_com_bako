class GamificationUser {
  String userName = '';
  int pontuacao = 0;
  List<bool> especieDescoberta = [
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
    false
  ];

  void updatePontuacao(int pontos) {
    print(pontuacao);

    pontuacao += pontos;
    print(pontuacao);
  }
}
