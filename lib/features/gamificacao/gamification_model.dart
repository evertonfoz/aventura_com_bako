class GamificationUser {
  String userName = '';
  int pontuacao = 0;
  List<bool> especieDescoberta = [
    true,
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
    false
  ];

  void updatePontuacao(int pontos) {
    print(pontuacao);

    pontuacao += pontos;
    print(pontuacao);
  }
}
