import 'package:flutter/material.dart';
import 'GridButton.dart';

class Grid extends StatefulWidget {
  var numbers = [];
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    var height = widget.size.height;

    return Container(
      height: height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: widget.numbers.length,
          itemBuilder: (context, index) {
            return widget.numbers[index] != 0
                ? GridButton("${widget.numbers[index]}", () {
                    widget.clickGrid(index);
                  })
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
