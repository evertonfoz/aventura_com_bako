# Minijogo Caça às árvores dentro do aplicativo Aventura com Bako

## Versão de desenvolvimento da branch
* Flutter 3.19.4 • channel stable
* Dart 3.3.2


## ChangeLog

1. Alterado o atributo primary do ElevatedButton.styleFrom par backgroundColor. Estava com erros nos arquivos `lib\features\gamificacao\jogo_adivinha\widgets\quiz.dart` e `lib\features\gamificacao\jogo_adivinha\widgets\tela_adivinha.dart`.
1. Adicionado biblioteca `permission_handler`
1. Alterado `AndroidManifest`
1. Adicionado `Method Channel`, `Event Channel` e código nativo para buscar todos os dispositivos bluetooth
1. Alterado `lib/features/home/presentation/pages/home_screen.dart` adicionando o menu de jogo `Caça às Árvores`
1. Criado pasta `lib/features/gamificacao/caca_arvores` para o minijogo
1. Criado pasta `assets/games/caca_arvores` para os assets do minijogo e adicionando ao `punspec.yaml`
1. Implementados o minijogo inicialmente sorteando árvores e buscando elas e indicando a distância
1. Minijogo ainda não tem leitura de qrcode inidicando se está na árvore certa
