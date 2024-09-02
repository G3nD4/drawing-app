import 'dart:developer' as dev;

import 'package:drawing_application/features/get_it/get_it.dart';
import 'package:drawing_application/features/logger/logger.dart';

mixin Logable {
  void log(Object object) => dev.log(
        object.toString(),
        name: '${toString()} --- ${DateTime.now().toString()}',
        time: DateTime.now(),
      );

  void writeToFileLog(Object object) => getIt.get<Logger>().writeToFile(
        object,
        name: toString(),
      );

  void logAndWriteToFile(Object object) {
    log(object);
    writeToFileLog(object);
  }
}
