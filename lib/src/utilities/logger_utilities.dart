import 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(
  methodCount: 2,
  errorMethodCount: 8,
  lineLength: 120,
  colors: true,
  printEmojis: true,
  printTime: false,
));
showInfoMessage(String message) {
  logger.i(message);
}

showWarningMessage(String message) {
  logger.w(message);
}

showErrorMessage(String message) {
  logger.e(message);
}

showTerribleErrorMessage(String message) {
  logger.wtf(message);
}
