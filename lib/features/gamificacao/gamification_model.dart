class GamificationUser {
  String userName = '';
  int pontuacao = 0;

  void updatePontuacao(int pontos) {
    print(pontuacao);

    pontuacao += pontos;
    print(pontuacao);
  }
}
