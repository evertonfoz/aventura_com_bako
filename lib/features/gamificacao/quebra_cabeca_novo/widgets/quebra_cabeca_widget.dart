import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:image/image.dart' as image;

class SlidePuzzleWidget extends StatefulWidget {
  const SlidePuzzleWidget(
      {super.key,
      required this.size,
      required this.sizePuzzle,
      required this.imageBckGround});
  final Size size;
  final int sizePuzzle;
  final Image imageBckGround;
  @override
  State<SlidePuzzleWidget> createState() => SlidePuzzleWidgetState();
}

class SlidePuzzleWidgetState extends State<SlidePuzzleWidget> {
  final GlobalKey _globalKey = GlobalKey();
  late Size size;

  List<SlideObject> slideObjects = [];

  bool puzzleGenerated = false;
  bool success = false;

  bool startSlide = false;

  List<int> process = [];

  bool finishSwap = false;
  late image.Image referenceImage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadReferenceImage(); // Carrega a imagem de referência durante a inicialização
  }

  @override
  Widget build(BuildContext context) {
    size = Size(widget.size.width - 10, widget.size.width - 5);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: widget.size.width,
          height: widget.size.width,
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              // Utilizamos Stack para empilhar o background e o puzzle box
              // 1º exibe a imagem de fundo
              if (widget.imageBckGround != null && slideObjects == null) ...[
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    height: double
                        .infinity, // Substitua double.maxFinite por double.infinity
                    child: widget.imageBckGround,
                  ),
                ),
              ],
              // 2º exibe o puzzle com espaços vazios
              if (slideObjects != null)
                ...slideObjects.where((slideObject) => slideObject.empty).map(
                  (slideObject) {
                    return Positioned(
                      left: slideObject.posCurrent.dx,
                      top: slideObject.posCurrent.dy,
                      child: SizedBox(
                        width: slideObject.size.width,
                        height: slideObject.size.height,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(2),
                          color: Colors.white24,
                          child: Stack(
                            children: [
                              if (slideObject.image != null) ...[
                                Opacity(
                                  opacity: success ? 1 : 0.3,
                                  child: slideObject.image,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              // Exibe as caixas não vazias
              if (slideObjects != null)
                ...slideObjects.where((slideObject) => !slideObject.empty).map(
                  (slideObject) {
                    // Alterado para AnimatedPositioned
                    // Desativa verificação de sucesso no processo de troca
                    return AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                      left: slideObject.posCurrent.dx,
                      top: slideObject.posCurrent.dy,
                      child: GestureDetector(
                        onTap: () => changePos(slideObject.indexCurrent),
                        child: SizedBox(
                          width: slideObject.size.width,
                          height: slideObject.size.height,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(2),
                            color: Colors.blue,
                            child: Stack(
                              children: [
                                if (slideObject.image != null) ...[
                                  slideObject.image,
                                ],
                                Center(
                                  child: Text(
                                    "${slideObject.indexDefault}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // u can use any button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => generatePuzzle(),
                  child: Text(slideObjects.isEmpty ? "Iniciar" : "Reiniciar"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  // for checking purpose
                  onPressed: startSlide ? null : () => reversePuzzle(),
                  child: const Text("Resolver"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => clearPuzzle(),
                  child: const Text("Limpar"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> loadReferenceImage() async {
    String path = "assets/games/Memoria/abelha.png";
    final ByteData data = await rootBundle.load(path);
    final List<int> bytes = data.buffer.asUint8List();
    image.Image img = image.decodeImage(Uint8List.fromList(bytes))!;
    setState(() {
      referenceImage = img;
      isLoading = false;
    });
  }

  void generatePuzzle() async {
    finishSwap = false;
    setState(() {});

    Size sizeBox = Size(widget.size.width / widget.sizePuzzle,
        widget.size.width / widget.sizePuzzle);

    slideObjects =
        List.generate(widget.sizePuzzle * widget.sizePuzzle, (index) {
      // we need setup offset 1st
      Offset offsetTemp = Offset(
        index % widget.sizePuzzle * sizeBox.width,
        index ~/ widget.sizePuzzle * sizeBox.height,
      );

      // set image crop for nice effect, check also if image is null
      image.Image tempCrop;
      tempCrop = image.copyCrop(
        referenceImage!,
        x: offsetTemp.dx.round(),
        y: offsetTemp.dy.round(),
        width: sizeBox.width.round(),
        height: sizeBox.height.round(),
      );

      return SlideObject(
        posCurrent: offsetTemp,
        posDefault: offsetTemp,
        indexCurrent: index,
        indexDefault: index + 1,
        size: sizeBox,
        image: Image.memory(
          image.encodePng(tempCrop),
          fit: BoxFit.contain,
        ),
      );
    }); //let set empty on last child

    slideObjects.last.empty = true;

    // make random.. im using smple method..just rndom with move it.. haha

    // setup moveMethod 1st
    // proceed with swap block place
    // swap true - we swap horizontal line.. false - vertical
    bool swap = true;
    process = [];

    // 20 * size puzzle shuffle
    for (var i = 0; i < widget.sizePuzzle * 20; i++) {
      for (var j = 0; j < widget.sizePuzzle / 2; j++) {
        SlideObject slideObjectEmpty = getEmptyObject();

        // get index of empty slide object
        int emptyIndex = slideObjectEmpty.indexCurrent;
        process.add(emptyIndex);
        int randKey;

        if (swap) {
          // horizontal swap
          int row = emptyIndex ~/ widget.sizePuzzle;
          randKey =
              row * widget.sizePuzzle + Random().nextInt(widget.sizePuzzle);
        } else {
          int col = emptyIndex % widget.sizePuzzle;
          randKey =
              widget.sizePuzzle * Random().nextInt(widget.sizePuzzle) + col;
        }

        // call change pos method we create before to swap place

        changePos(randKey);
        // ops forgot to swap
        // hmm bug.. :).. let move 1st with click..check whther bug on swap or change pos
        swap = !swap;
      }
    }

    startSlide = false;
    finishSwap = true;
    puzzleGenerated = true;
    setState(() {});
  }

  SlideObject getEmptyObject() {
    return slideObjects.firstWhere((element) => element.empty);
  }

  changePos(int indexCurrent) {
    // problem here i think..
    SlideObject slideObjectEmpty = getEmptyObject();

    // get index of empty slide object
    int emptyIndex = slideObjectEmpty.indexCurrent;

    // min & max index based on vertical or horizontal

    int minIndex = min(indexCurrent, emptyIndex);
    int maxIndex = max(indexCurrent, emptyIndex);

    // temp list moves involves
    List<SlideObject> rangeMoves = [];

    // check if index current from vertical / horizontal line
    if (indexCurrent % widget.sizePuzzle == emptyIndex % widget.sizePuzzle) {
      // same vertical line
      rangeMoves = slideObjects
          .where((element) =>
              element.indexCurrent % widget.sizePuzzle ==
              indexCurrent % widget.sizePuzzle)
          .toList();
    } else if (indexCurrent ~/ widget.sizePuzzle ==
        emptyIndex ~/ widget.sizePuzzle) {
      rangeMoves = slideObjects;
    } else {
      rangeMoves = [];
    }

    rangeMoves = rangeMoves
        .where((puzzle) =>
            puzzle.indexCurrent >= minIndex &&
            puzzle.indexCurrent <= maxIndex &&
            puzzle.indexCurrent != emptyIndex)
        .toList();

    // check empty index under or above current touch
    if (emptyIndex < indexCurrent) {
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 1 : 0);
    } else {
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 0 : 1);
    }

    // check if rangeMOves is exist,, then proceed switch position
    if (rangeMoves.isNotEmpty) {
      int tempIndex = rangeMoves[0].indexCurrent;

      Offset tempPos = rangeMoves[0].posCurrent;

      // yeayy.. sorry my mistake.. :)
      for (var i = 0; i < rangeMoves.length - 1; i++) {
        rangeMoves[i].indexCurrent = rangeMoves[i + 1].indexCurrent;
        rangeMoves[i].posCurrent = rangeMoves[i + 1].posCurrent;
      }

      rangeMoves.last.indexCurrent = slideObjectEmpty.indexCurrent;
      rangeMoves.last.posCurrent = slideObjectEmpty.posCurrent;

      // haha ..i forget to setup pos for empty puzzle box.. :p
      slideObjectEmpty.indexCurrent = tempIndex;
      slideObjectEmpty.posCurrent = tempPos;
    }

    // this to check if all puzzle box already in default place.. can set callback for success later
    if (slideObjects
                .where((slideObject) =>
                    slideObject.indexCurrent == slideObject.indexDefault - 1)
                .length ==
            slideObjects.length &&
        finishSwap) {
      print("Success");
      success = true;
    } else {
      success = false;
    }

    startSlide = true;
    setState(() {});
  }

  void clearPuzzle() {
    setState(() {
      // checking already slide for reverse purpose
      startSlide = true;
      slideObjects = [];
      finishSwap = true;
      puzzleGenerated = false;
    });
  }

  reversePuzzle() async {
    startSlide = true;
    finishSwap = true;
    setState(() {});

    await Stream.fromIterable(process.reversed)
        .asyncMap((event) async =>
            await Future.delayed(const Duration(milliseconds: 50))
                .then((value) => changePos(event)))
        .toList();

    // yeayy
    process = [];
    setState(() {});
  }
}

class SlideObject {
  // setup offset for default / current position
  Offset posDefault;
  Offset posCurrent;
  // setup index for default / current position
  int indexDefault;
  int indexCurrent;
  // status box is empty
  bool empty;
  // size each box
  Size size;
  // Image field for crop later
  Image image;

  SlideObject({
    this.empty = false,
    required this.image,
    required this.indexCurrent,
    required this.indexDefault,
    required this.posCurrent,
    required this.posDefault,
    required this.size,
  });
}
