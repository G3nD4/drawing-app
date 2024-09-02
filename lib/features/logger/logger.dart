import 'dart:developer';
import 'dart:io';

class Logger {
  Logger([this._logFilePath = '']) {
    if (_logFilePath.isNotEmpty) {
      _logFile = File(_logFilePath);
    } else {
      _logFile = null;
    }
  }

  /// Provide this if you want to log to a file.
  final String _logFilePath;
  late final File? _logFile;

  void writeToLog(Object object, {String name = ''}) {
    log(object.toString(), name: name, time: DateTime.now());

    writeToFile(object, name: name);
  }

  void writeToFile(Object object, {String name = ''}) {
    _logFile?.openWrite(mode: FileMode.append)
      ?..write(_logString(object, name))
      ..close();
  }

  String _logString(Object object, [String? name]) {
    final String splitter = '-' * 20;
    final String logString =
        '[${DateTime.now().toString()}]\nName: $name\n${object.toString()}';

    return '$splitter\n$logString\n\n';
  }
}
