import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ClearDrawingButton extends StatelessWidget {
  const ClearDrawingButton({super.key, required this.onClearPressed});

  final void Function() onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onClearPressed,
      child: const Icon(
        CupertinoIcons.clear_circled_solid,
        color: Colors.blue,
        size: 32.0,
      ),
    );
  }
}
