class Pergunta {
  final String imagePath;
  final String descricao;
  final String respostaCorreta;
  final List<String> opcoesIncorretas;

  Pergunta({
    required this.imagePath,
    required this.descricao,
    required this.respostaCorreta,
    required this.opcoesIncorretas,
  });

  // Factory method to create a Pergunta instance with shuffled options
  factory Pergunta.fromShuffledOptions(Pergunta pergunta) {
    List<String> opcoes = List.from(pergunta.opcoesIncorretas)
      ..add(pergunta.respostaCorreta);

    // Shuffle the combined list
    opcoes.shuffle();

    return Pergunta(
      imagePath: pergunta.imagePath,
      descricao: pergunta.descricao,
      respostaCorreta: pergunta.respostaCorreta,
      opcoesIncorretas: opcoes,
    );
  }
}

List<Pergunta> obterListaDePerguntas() {
  return [
    Pergunta(
      imagePath: 'assets/Paineira-rosa-1.jpg',
      descricao: 'Descrição 1...',
      respostaCorreta: 'Paineira',
      opcoesIncorretas: ['Margarita', 'Rosa do deserto', 'Girasol'],
    ),
    Pergunta(
      imagePath: 'assets/Paineira-rosa-2.jpg',
      descricao: 'Descrição 1...',
      respostaCorreta: 'Paineira',
      opcoesIncorretas: ['Ariticum', 'Bacupari', 'Figueira'],
    ),
  ];
}
