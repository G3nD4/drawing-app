import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ColorToolbar extends StatefulWidget {
  const ColorToolbar({
    super.key,
    this.initialColor = Colors.black,
    this.onColorChanged,
  });

  final Color initialColor;
  final void Function(Color)? onColorChanged;

  @override
  State<ColorToolbar> createState() => _ColorToolbarState();
}

class _ColorToolbarState extends State<ColorToolbar> {
  final List<Color> _colors = const <Color>[
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.white,
  ];

  late int _choosenIndex;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _colors.length; i++) {
      if (_colors[i] == widget.initialColor) {
        _choosenIndex = i;
        break;
      }
    }
  }

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
        children: List<Widget>.generate(
          _colors.length,
          (int index) => Bounceable(
            onTap: widget.onColorChanged == null
                ? null
                : () {
                    setState(() {
                      _choosenIndex = index;
                      widget.onColorChanged!(_colors[index]);
                    });
                  },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _colors[index],
              ),
              child: Center(
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index != _choosenIndex
                        ? Colors.transparent
                        : _colors[index] == Colors.white
                            ? Colors.black
                            : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          growable: false,
        ),
      ),
    );
  }
}
