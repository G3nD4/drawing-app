import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../logger/logger.dart';
import 'get_it.config.dart';

final getIt = GetIt.instance;
const String environment = Environment.dev;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init(environment: environment);

void setupLogger() async {
  final String logFilePath = '${(await getApplicationCacheDirectory()).path}/log.txt';
  getIt.registerSingleton<Logger>(Logger(logFilePath));
}
