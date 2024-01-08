import 'package:flutter/material.dart';

class GridButton extends StatefulWidget {
  Function click;
  String text;

  GridButton(this.text, this.click);

  @override
  State<GridButton> createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Chame a função widget.click aqui
        widget.click();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
