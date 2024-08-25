import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ColorToolbar extends StatelessWidget {
  const ColorToolbar({super.key});

  final List<Color> _colors = const <Color>[
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _colors
            .map((final Color color) => Bounceable(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  )),
            ))
            .toList(),
      ),
    );
  }
}
