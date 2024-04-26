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
      descricao:
          'O bosque da UTFPR faz parte de um tipo de floresta chamada Floresta Estacional Semidecidual. Qual é a principal característica desse tipo de formação florestal?',
      respostaCorreta:
          'Parte das suas espécies (até 30%) perdem as suas folhas na época seca do ano',
      opcoesIncorretas: [
        'Possuem somente pinheiros.',
        'Só possuem espécies que são árvores',
        'Todas as suas espécies perdem as suas folhas em julho'
      ],
    ),
    Pergunta(
      imagePath: 'assets/Paineira-rosa-2.jpg',
      descricao:
          'A mascote do Bosque, o Bako, é uma homenagem ao fruto de uma das árvores presentes na trilha, a Garcinia gardeneriana, o popular bacupari. Sobre esse fruto assinale a cor dele.',
      respostaCorreta: 'Amarelo',
      opcoesIncorretas: ['Roxo', 'Vermelho', 'Azul'],
    ),
  ];
}
