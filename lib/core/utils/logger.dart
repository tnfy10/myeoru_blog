import 'package:logger/logger.dart';

final logger = Logger(
  filter: ProductionFilter(),
  printer: PrefixPrinter(SimplePrinter(
    colors: true,
    printTime: true,
  )),
  output: ConsoleOutput()
);