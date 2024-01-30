import 'package:flutter_print_layer/core/enum/printer_devices.dart';
import 'package:flutter_print_layer/core/printer/devices/gs300_printer.dart';
import 'package:flutter_print_layer/core/printer/printers.dart';

class PrinterFactory {
  static Printers createDevice(String deviceName) {
    Devices deviceEnum = _getDeviceEnum(deviceName);

    switch (deviceEnum) {
      case Devices.GS300:
        return Gs300Printer(); // Replace Object() with the actual class or object creation logic
      // Add cases for other enum values as needed
      default:
        throw Exception('Unsupported device: $deviceName');
    }
  }

  static Devices _getDeviceEnum(String deviceName) {
    switch (deviceName.toLowerCase()) {
      case 'gs300':
        return Devices.GS300;

      // Add cases for other device names as needed
      default:
        throw Exception('Unknown device name: $deviceName');
    }
  }
}
