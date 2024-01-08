import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  Function reset;
  String text;

  ResetButton(this.reset, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Chame a função reset aqui
        reset();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text("Reset"),
    );
  }
}
