import 'package:flutter/material.dart';

Future<void> alertInfoDialog(
  BuildContext context, {
  String? title,
  required String body,
  String closeButtonText = 'Ok',
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: title == null ? null : Text(title),
        content: Text(body),
        actions: <Widget>[
          TextButton(
            child: Text(closeButtonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
