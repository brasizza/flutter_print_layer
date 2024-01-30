library flutter_print_layer;

import 'package:flutter_print_layer/core/enum/print_enum.dart';
import 'package:flutter_print_layer/core/factory/printer_factory.dart';
import 'package:flutter_print_layer/core/models/text_model.dart';
import 'package:flutter_print_layer/core/printer/printers.dart';

class PrinterLayer {
  void print(String device) {
    Printers printer = PrinterFactory.createDevice(device);

    printer.printString(TextModel(text: 'MARCUS BRASIZZA', fontSize: 12, algin: PrintAlignLayer.RIGHT));
  }
}
