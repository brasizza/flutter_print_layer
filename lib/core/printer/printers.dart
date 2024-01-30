import 'package:flutter_print_layer/core/models/text_model.dart';

abstract class Printers {
  get isConnected;
  String? devicePort = "";
  Future<bool> connect();
  Future<bool> disconnect();
  Future<void> printString(TextModel data);
  Future<void> printByte(List<int> bytes);
  Future<void> cut();
  Future<void> feed(int times);
}
