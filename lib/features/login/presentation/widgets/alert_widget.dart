import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Ok"),
              )
            ],
          ));
}
