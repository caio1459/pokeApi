extension StringExtension on String {
  int toInt({int valueDefault = 0}) {
    try {
      return int.parse(this);
    } on Exception catch (_) {
      return valueDefault;
    }
  }

  num toDouble({double valueDefault = 0}) {
    try {
      return int.parse(this);
    } on Exception catch (_) {
      return valueDefault;
    }
  }
}
