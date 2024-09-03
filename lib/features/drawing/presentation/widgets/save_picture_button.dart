import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SavePictureButton extends StatelessWidget {
  const SavePictureButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: const Icon(Icons.save),
      ),
    );
  }
}
