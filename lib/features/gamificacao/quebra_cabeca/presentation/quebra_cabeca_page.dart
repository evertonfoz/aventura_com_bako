import 'dart:typed_data';
import 'dart:math';
import 'package:aventura_com_bako/features/gamificacao/quebra_cabeca/mobx/quebra_cabeca_mobx.dart';
import 'package:aventura_com_bako/features/gamificacao/quebra_cabeca/presentation/resolveu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image/image.dart' as img;

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({super.key});

  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  late List<img.Image?> puzzlePieces;
  late List<img.Image?> originalPieces;
  late List<String> imagePaths = [
    'assets/games/quebra_cabeca_teste.jpeg',
    //'assets/background_forest.jpg',
  ];
  late img.Image
      referenceImage; // Variável para armazenar a imagem de referência
  bool isLoading = true; // Variável para controlar o estado de carregamento
  double dificultyMultiplier = 0.5;
  int gridSize = 3;
  late int emptyRow;
  late int emptyCol;

  final _quebraCabecaMobx = QuebraCabecaMobx();

  @override
  void initState() {
    super.initState();
    loadReferenceImage(); // Carrega a imagem de referência durante a inicialização
  }

  Future<void> loadReferenceImage() async {
    String randomImagePath = imagePaths[Random().nextInt(imagePaths.length)];
    final ByteData data = await rootBundle.load(randomImagePath);
    final List<int> bytes = data.buffer.asUint8List();
    img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    setState(() {
      referenceImage = image;
      isLoading = false; // Indica que o carregamento foi concluído
      initializePuzzle(); // Chama initializePuzzle após o carregamento da imagem de referência
    });
  }

  Future<void> initializePuzzle() async {
    setState(() {
      originalPieces = List.generate(gridSize * gridSize - 1, (index) {
        int pieceSize =
            referenceImage.width ~/ gridSize; // Usar referenceImage aqui
        int row = index ~/ gridSize;
        int col = index % gridSize;

        img.Image piece = img.copyCrop(
          referenceImage, // Usar referenceImage aqui
          x: col * pieceSize,
          y: row * pieceSize,
          width: pieceSize,
          height: pieceSize,
        );

        return piece;
      });

      // Add the empty piece at the end of the list
      originalPieces.add(null);

      // Set the puzzle to the solved state
      puzzlePieces = List.from(originalPieces);

      // Perform additional random valid moves
      Random random = Random();
      for (int i = 0; i < 1000; i++) {
        List<int> movableIndices = [];
        for (int j = 0; j < puzzlePieces.length; j++) {
          if (puzzlePieces[j] == null) {
            continue; // Skip the empty piece
          }

          int row = j ~/ gridSize;
          int col = j % gridSize;

          if ((row < gridSize - 1 && puzzlePieces[j + gridSize] == null) ||
              (row > 0 && puzzlePieces[j - gridSize] == null) ||
              (col < gridSize - 1 && puzzlePieces[j + 1] == null) ||
              (col > 0 && puzzlePieces[j - 1] == null)) {
            movableIndices.add(j);
          }
        }

        if (movableIndices.isNotEmpty) {
          int randomIndex =
              movableIndices[random.nextInt(movableIndices.length)];
          int? emptyIndex = puzzlePieces.indexOf(null);

          // Swap the piece with the empty piece if not null
          if (emptyIndex != null) {
            img.Image? temp = puzzlePieces[randomIndex];
            puzzlePieces[randomIndex] = puzzlePieces[emptyIndex];
            puzzlePieces[emptyIndex] = temp;
          }
        }
      }

      // Set the initial position of the empty piece
      updateEmptyPosition();
    });
  }

  bool isSolvable(List<img.Image?> puzzle) {
    List<int?> puzzleIndices = puzzle
        .map((image) => image != null ? originalPieces.indexOf(image) : null)
        .toList(growable: false);

    int inversions = 0;
    for (int i = 0; i < puzzleIndices.length - 1; i++) {
      for (int j = i + 1; j < puzzleIndices.length; j++) {
        if (puzzleIndices[i] != null &&
            puzzleIndices[j] != null &&
            puzzleIndices[i]! > puzzleIndices[j]!) {
          inversions++;
        }
      }
    }

    // Add 1 if the empty piece is in an even row from the bottom
    if (puzzleIndices.contains(null)) {
      int emptyIndex = puzzleIndices.indexOf(null);
      int emptyRow = emptyIndex ~/ gridSize;
      int targetRow = (originalPieces.length - 1) ~/ gridSize;
      if ((targetRow - emptyRow) % 2 == 0) {
        inversions++;
      }
    }

    return inversions % 2 == 0;
  }

  void updateEmptyPosition() {
    for (int i = 0; i < puzzlePieces.length; i++) {
      if (puzzlePieces[i] == null) {
        emptyRow = i ~/ gridSize;
        emptyCol = i % gridSize;
        break;
      }
    }
  }

  bool isPuzzleSolved() {
    for (int i = 0; i < puzzlePieces.length - 1; i++) {
      if (puzzlePieces[i] != originalPieces[i]) {
        return false;
      }
    }
    return true;
  }

  void handlePieceTap(int tappedRow, int tappedCol) {
    if ((tappedRow == emptyRow && (tappedCol - emptyCol).abs() == 1) ||
        (tappedCol == emptyCol && (tappedRow - emptyRow).abs() == 1)) {
      int tappedIndex = tappedRow * gridSize + tappedCol;
      img.Image? temp = puzzlePieces[tappedIndex];
      puzzlePieces[tappedIndex] = puzzlePieces[emptyRow * gridSize + emptyCol];
      puzzlePieces[emptyRow * gridSize + emptyCol] = temp;
      emptyRow = tappedRow;
      emptyCol = tappedCol;

      _quebraCabecaMobx.newMovesCount = _quebraCabecaMobx.movesCount + 1;
      setState(() {});

      if (isPuzzleSolved()) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PuzzleResolveuPage()));
      }
    }
  }

  void solvePuzzle() {
    setState(() {
      puzzlePieces = List.from(originalPieces);
      puzzlePieces[gridSize * gridSize - 1] = null;
      emptyRow = gridSize - 1;
      emptyCol = gridSize - 1;

      if (isPuzzleSolved()) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PuzzleResolveuPage()));
      }
    });
  }

  void resetPuzzle() {
    setState(() {
      initializePuzzle(); // Call initializePuzzle to reset the puzzle
      _quebraCabecaMobx.newMovesCount = 0; // Reset the moves count
    });
  }

  void shufflePuzzle() {
    do {
      setState(() {
        puzzlePieces = List.from(originalPieces)..shuffle();
        updateEmptyPosition();
        _quebraCabecaMobx.newMovesCount = 0;
      });
    } while (!isSolvable(puzzlePieces));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quebra-cabeça'),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.white38, BlendMode.screen),
                  image: AssetImage('assets/Padrão4.jpg'),
                  fit: BoxFit.cover)),
        ),
        Center(
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.amberAccent.withOpacity(0.7),
                blurRadius: MediaQuery.of(context).size.width * 2,
              )
            ]),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: gridSize == 2
                          ? null
                          : () {
                              setState(() {
                                gridSize = 2;
                                resetPuzzle();
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Fácil',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                        onPressed: gridSize == 3
                            ? null
                            : () {
                                setState(() {
                                  gridSize = 3;
                                  resetPuzzle();
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Médio',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: gridSize == 4
                            ? null
                            : () {
                                setState(() {
                                  gridSize = 4;
                                  resetPuzzle();
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Difícil',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                  ],
                ),

                const Divider(),
                // Display moves count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Observer(
                      builder: (context) => Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white60,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Movimentos: ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        _quebraCabecaMobx.movesCount.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    )),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => resetPuzzle(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Reiniciar",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                // Display the puzzle
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridSize,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemBuilder: (context, index) {
                        int row = index ~/ gridSize;
                        int col = index % gridSize;

                        if (isLoading) {
                          // Exibe um indicador de carregamento enquanto a imagem está sendo carregada
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        //Código comentado para que numeros não apareçam no meio das imagens
                        // if (puzzlePieces[index] != null) {
                        //   return GestureDetector(
                        //     onTap: () => handlePieceTap(row, col),
                        //     child: Stack(
                        //       alignment: Alignment.center,
                        //       children: [
                        //         Image.memory(Uint8List.fromList(
                        //             img.encodePng(puzzlePieces[index]!))),
                        //         Text(
                        //           '${originalPieces.indexOf(puzzlePieces[index])}',
                        //           style: const TextStyle(
                        //             color: Colors.red,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // } else {
                        //   return Container(
                        //     color: Colors.grey,
                        //     child: Center(
                        //       child: Text(
                        //         '${originalPieces.indexOf(null)}',
                        //         style: const TextStyle(
                        //           color: Colors.red,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        // }
                        if (puzzlePieces[index] != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Observer(
                              builder: (context) => GestureDetector(
                                onTap: () => handlePieceTap(row, col),
                                child: Image.memory(Uint8List.fromList(
                                    img.encodePng(puzzlePieces[index]!))),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            color: Colors.transparent,
                          );
                        }
                      },
                      itemCount: gridSize * gridSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
