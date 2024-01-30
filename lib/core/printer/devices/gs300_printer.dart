import 'dart:typed_data';

import 'package:flutter_print_layer/core/models/text_model.dart';
import 'package:flutter_print_layer/core/printer/printers.dart';
import 'package:gertec_gs300/core/helpers/constants.dart';
import 'package:gertec_gs300/core/helpers/models/gertec_text.dart';
import 'package:gertec_gs300/gertec_gs300.dart';

class Gs300Printer implements Printers {
  final GertecGs300 device = GertecGs300();
  @override
  String? devicePort;

  @override
  Future<bool> connect() async {
    return true;
  }

  @override
  Future<void> cut() async {
    await device.cutPaper(CutPaperType.FULL);
  }

  @override
  Future<bool> disconnect() async {
    return true;
  }

  @override
  Future<void> feed(int times) async {
    device.wrap(len: times);
  }

  @override
  get isConnected => true;

  @override
  Future<void> printByte(List<int> bytes) async {
    await device.printRaw((Uint8List.fromList(bytes)));
  }

  @override
  Future<void> printString(TextModel data) async {
    await device.printText(
      GertecText(
        text: data.text,
        algin: PrintAlign.values.firstWhere((element) => (element.value == data.algin.value), orElse: () => PrintAlign.LEFT),
        bold: data.bold,
        fontSize: FontSize.values.firstWhere((element) => (element.value == data.algin.value), orElse: () => FontSize.NORMAL),
        underline: data.underline,
        letterSpacing: data.letterSpacing,
        lineHeight: data.lineHeight,
        wordwrap: data.wordwrap,
        marginLeft: data.letterSpacing,
      ),
    );
  }
}
