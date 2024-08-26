import 'package:drawing_application/extensions/stroke_width_enum_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../domain/entities/enums/stroke_width_enum.dart';

class StrokeToolbar extends StatefulWidget {
  const StrokeToolbar({
    super.key,
    this.initialStrokeWidth = StrokeWidthEnum.medium,
    this.onStrokeWidthChanged,
  });

  final StrokeWidthEnum initialStrokeWidth;
  final Function(StrokeWidthEnum)? onStrokeWidthChanged;

  @override
  State<StrokeToolbar> createState() => _StrokeToolbarState();
}

class _StrokeToolbarState extends State<StrokeToolbar> {
  late StrokeWidthEnum _choosenStrokeWidth;

  late final List<StrokeWidthEnum> _strokeWidths;

  @override
  void initState() {
    super.initState();
    _choosenStrokeWidth = widget.initialStrokeWidth;
    _strokeWidths = StrokeWidthEnum.values;
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: _strokeWidths
            .map(
              (final StrokeWidthEnum strokeWidth) => Bounceable(
                onTap: () {
                  setState(() {
                    _choosenStrokeWidth = strokeWidth;
                  });
                  widget.onStrokeWidthChanged?.call(strokeWidth);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  height: strokeWidth.toolbarWidth,
                  width: strokeWidth.toolbarWidth,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Container(
                      height: strokeWidth.toolbarWidth / 2.5,
                      width: strokeWidth.toolbarWidth / 2.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Enum.compareByIndex(
                                  strokeWidth,
                                  _choosenStrokeWidth,
                                ) ==
                                0
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
