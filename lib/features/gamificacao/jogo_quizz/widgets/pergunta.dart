class Pergunta {
  final String descricao;
  final String respostaCorreta;
  final int recompensa;
  final List<String> opcoesIncorretas;

  Pergunta({
    required this.descricao,
    required this.recompensa,
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
      descricao: pergunta.descricao,
      recompensa: pergunta.recompensa,
      respostaCorreta: pergunta.respostaCorreta,
      opcoesIncorretas: opcoes,
    );
  }
}

List<Pergunta> obterListaDePerguntas() {
  return [
    Pergunta(
      recompensa: 10,
      descricao:
          'O bosque da UTFPR faz parte de um tipo de floresta chamada Floresta Estacional Semidecidual. Qual é a principal característica desse tipo de formação florestal?',
      respostaCorreta:
          'Parte das suas espécies (até 30%) perdem as suas folhas na época seca do ano',
      opcoesIncorretas: [
        'Só possuem espécies que são árvores',
        'Todas as suas espécies perdem as suas folhas em julho'
      ],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'Vocês ficaram sabendo que o bosque, mesmo sendo uma área-verde pequena é responsável por uma série de benefícios para o município de Medianeira, assim como qualquer outra área verde dentro de cidades. Assinale a alternativa que não é um benefício do bosque.',
      respostaCorreta:
          'Prejudica a infiltração da água ajudando nos alagamentos dentro das cidades.',
      opcoesIncorretas: [
        'Fornece abrigo para a fauna, como pássaros e pequenos mamíferos.',
        'Proporciona equilíbrio de temperatura e umidade dentro das cidades. '
      ],
    ),
    Pergunta(
      recompensa: 10,
      descricao:
          'Uma das espécies que vocês viram ao longo da trilha do bosque foi a espécie Ceiba speciosa, conhecida popularmente como paineira-rosa. Ela tem algumas características bem marcantes. Assinale quais são essas características.',
      respostaCorreta:
          'Presença de acúleos no tronco (espécie de espinho grosso).',
      opcoesIncorretas: ['Flor amarela', 'Fruto vermelho'],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'A mascote do Bosque, o Bako, é uma homenagem ao fruto de uma das árvores presentes na trilha, a Garcinia gardeneriana, o popular bacupari. Sobre esse fruto assinale a cor dele.',
      respostaCorreta: 'Amarelo',
      opcoesIncorretas: ['Roxo', 'Vermelho'],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'Ao longo da trilha podemos ver a presença de muitos fungos (cogumelos, orelha de pau). Sobre isso assinale a resposta que mostra qual o papel ecológico desses organismos.',
      respostaCorreta:
          'São responsáveis pelo processo de decomposição, retornando os nutrientes para o solo.',
      opcoesIncorretas: [
        'Eles matam a árvore porque sugam toda a sua seiva.',
        'Eles captam a luz do sol para fazer fotossíntese.'
      ],
    ),
    Pergunta(
      recompensa: 10,
      descricao:
          'Uma das árvores vistas ao longo da trilha do Bosque da UTFPR  apresenta as seguintes características marcantes, casca com a presença de acúleos (espécie de espinho), flores marcantes rosas. Essa espécie arbórea é:',
      respostaCorreta: 'Ceiba speciosa - paineira-rosa',
      opcoesIncorretas: [
        'Parapiptadenia rigida - angico-vermelho',
        'Garcinia gardneriana - bacupari'
      ],
    ),
    Pergunta(
      recompensa: 10,
      descricao:
          ' A espécie arbórea presente na trilha, Ceiba speciosa, popularmente chamada de paineira-rosa, apresenta uma estrutura que parece um algodão e é vista logo depois de aparecerem os seus frutos, que estrutura é essa?',
      respostaCorreta:
          'É a paina e faz parte do fruto. Ela aparece quando o fruto está maduro e serve para ajudar na dispersão das sementes.',
      opcoesIncorretas: [
        'É um ninho de inseto que vive associado com as paineiras.',
        'São frutos que não se desenvolveram por completo.'
      ],
    ),
    Pergunta(
      recompensa: 5,
      descricao: 'Quais são os principais polinizadores do Bosque da UTFPR?',
      respostaCorreta: 'Todas as alternativas estão corretas.',
      opcoesIncorretas: ['Passarinhos e Insetos.', 'Borboletas e Abelhas.'],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'A floração da espécie arbórea Jacaranda micrantha conhecida popularmente como Caroba ocorre nos meses de setembro a outubro e suas flores têm coloração?',
      respostaCorreta: 'Rosas ou azuis.',
      opcoesIncorretas: ['Amarelas.', 'Brancas.'],
    ),
    Pergunta(
      recompensa: 10,
      descricao:
          'Existe uma espécie no bosque que está ameaçada de extinção e no bosque temos três indivíduos dela. Você sabe qual é?',
      respostaCorreta: 'Cedrella fissilis - Cedro-rosa',
      opcoesIncorretas: [
        'Parapiptadenia rigida - Angico vermelho.',
        'Garcinia gardeneriana - Bacupari '
      ],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'Todas as árvores que conhecemos são de um grupo de plantas chamadas angiospermas. A principal característica desse grupo é produzir flores. Você sabe para que servem as flores na natureza e na vida dessas árvores?',
      respostaCorreta:
          'Elas ajudam as plantas a fazer novas sementes. Quando uma abelha visita a flor, ela leva o pólen de uma flor para outra, fazendo as sementes crescerem.',
      opcoesIncorretas: [
        'Elas servem para deixar a árvore bonita.',
        'Servem para deixar o ambiente cheiroso.'
      ],
    ),
    Pergunta(
      recompensa: 5,
      descricao:
          'Existem alguns animais que ajudam as flores a produzirem novas sementes. Eles são chamados de polinizadores. Você sabe quem são eles?',
      respostaCorreta: 'Abelhas, beija-flores e morcegos.',
      opcoesIncorretas: [
        'Ratos e borboletas.',
        'Libélulas, araras e esquilos.'
      ],
    ),
    Pergunta(
      recompensa: 5,
      descricao: 'Qual é a importância dos frutos na natureza?',
      respostaCorreta: 'Eles protegem as sementes.',
      opcoesIncorretas: [
        'Os frutos se transformam em flores.',
        'Eles servem para cuidar da árvore.'
      ],
    ),
  ];
}
