import 'package:flutter/material.dart';

Future<bool> alertConfirmationDialog(
  BuildContext context, {
  String? title,
  required String confirmationText,
  String deny = 'No',
  String confirm = 'Yes',
}) async {
  bool confirmed = false;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: title == null ? null : Text(title),
        content: Text(confirmationText),
        actions: [
          TextButton(
            child: Text(deny),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(confirm),
            onPressed: () {
              confirmed = true;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return confirmed;
}
