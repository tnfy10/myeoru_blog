import 'package:logger/logger.dart';

final logger = Logger(
  filter: ProductionFilter(),
  printer: PrefixPrinter(PrettyPrinter(
    colors: true,
    printTime: true,
  )),
  output: ConsoleOutput()
);