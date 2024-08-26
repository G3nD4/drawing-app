extension ListX on List<num> {
  num min() {
    if (isEmpty) {
      throw StateError('No elements');
    }
    num minValue = this[0];
    for (var value in this) {
      if (value < minValue) {
        minValue = value;
      }
    }
    return minValue;
  }

  num max() {
    if (isEmpty) {
      throw StateError('No elements');
    }
    num maxValue = this[0];
    for (var value in this) {
      if (value > maxValue) {
        maxValue = value;
      }
    }
    return maxValue;
  }
}