import 'package:flutter/material.dart';

Future<String?> alertPromptStringField(
  BuildContext context, {
  required String title,
  String deny = 'Cancel',
  String confirm = 'Continue',
}) async {
  String? value;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: TextFormField(
          onChanged: (String text) => value = text,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(deny),
            onPressed: () {
              value = null;
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(confirm),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return value;
}
