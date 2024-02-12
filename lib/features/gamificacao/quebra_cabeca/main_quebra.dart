import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

void main() => runApp(Quebra_cabeca());

class Quebra_cabeca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PuzzleGame(),
    );
  }
}

class PuzzleGame extends StatefulWidget {
  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  late List<img.Image?> puzzlePieces;
  late List<img.Image?> originalPieces;
  int gridSize = 3; // Puzzle size (3x3 in this example)
  late int emptyRow; // Row of the empty piece
  late int emptyCol; // Column of the empty piece
  int movesCount = 0; // Moves counter

  @override
  void initState() {
    super.initState();
    puzzlePieces = List.generate(gridSize * gridSize, (index) => null);
    originalPieces = List.generate(gridSize * gridSize - 1, (index) => null);
    initializePuzzle();
  }

  Future<void> initializePuzzle() async {
    final ByteData data = await rootBundle.load('assets/Paineira-rosa-1.jpg');
    final List<int> bytes = data.buffer.asUint8List();
    img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;

    setState(() {
      originalPieces = List.generate(gridSize * gridSize - 1, (index) {
        int pieceSize = image.width ~/ gridSize;
        int row = index ~/ gridSize;
        int col = index % gridSize;

        img.Image piece = img.copyCrop(
          image,
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
      setState(() {
        int tappedIndex = tappedRow * gridSize + tappedCol;
        img.Image? temp = puzzlePieces[tappedIndex];
        puzzlePieces[tappedIndex] =
            puzzlePieces[emptyRow * gridSize + emptyCol];
        puzzlePieces[emptyRow * gridSize + emptyCol] = temp;
        emptyRow = tappedRow;
        emptyCol = tappedCol;

        movesCount++;
      });

      if (isPuzzleSolved()) {
        showCongratulationsDialog();
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
        showCongratulationsDialog();
      }
    });
  }

  void showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Parabéns!'),
          content:
              Text('Você completou o quebra-cabeça em $movesCount movimentos!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetPuzzle(); // Change to call resetPuzzle
              },
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  void resetPuzzle() {
    setState(() {
      initializePuzzle(); // Call initializePuzzle to reset the puzzle
      movesCount = 0; // Reset the moves count
    });
  }

  void shufflePuzzle() {
    do {
      setState(() {
        puzzlePieces = List.from(originalPieces)..shuffle();
        updateEmptyPosition();
        movesCount = 0;
      });
    } while (!isSolvable(puzzlePieces));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.center,
            color: Colors.green, // Mudar a cor de fundo do título
            padding: const EdgeInsets.only(
                bottom: 0), // Adiciona um espaçamento inferior
            child: const Text(
              'Quebra-Cabeça',
              style: TextStyle(
                color: Colors.white, // Mudar a cor do texto do título
                fontSize: 20, // Ajustar o tamanho da fonte do título
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.green,
      body: Column(
        children: [
          // Display the puzzle
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ gridSize;
                int col = index % gridSize;

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
                  return GestureDetector(
                    onTap: () => handlePieceTap(row, col),
                    child: Image.memory(Uint8List.fromList(
                        img.encodePng(puzzlePieces[index]!))),
                  );
                } else {
                  return Container(
                    color: Colors.grey,
                  );
                }
              },
              itemCount: gridSize * gridSize,
            ),
          ),

          // Display moves count
          Text('Moves: $movesCount'),

          // Display the reference image below the puzzle and in a smaller size
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/Paineira-rosa-1.jpg',
              height: 150.0, // Adjust the height as needed
              width: 150.0, // Adjust the width as needed
            ),
          ),
        ],
      ),
    );
  }
}
