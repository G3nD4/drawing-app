import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class StrokeToolbar extends StatelessWidget {
  const StrokeToolbar({super.key});

  final List<int> _strokeWidths = const <int>[
    2,
    4,
    8,
    16,
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: _strokeWidths
            .map((final int strokeWidth) => Bounceable(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  height: (2 * strokeWidth).toDouble(),
                  width: (2 * strokeWidth).toDouble(),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  )),
            ))
            .toList(),
      ),
    );
  }
}
