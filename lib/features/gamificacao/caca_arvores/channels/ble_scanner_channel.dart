import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class BleScannerChannel {
  //method channels
  final MethodChannel _methodStart = const MethodChannel('ble_scanner/method');
  Future startScan() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.bluetooth.request().isGranted &&
        await Permission.locationWhenInUse.request().isGranted &&
        await Permission.location.request().isGranted &&
        await Permission.bluetooth.request().isGranted &&
        await Permission.bluetoothAdvertise.request().isGranted) {
      await _methodStart.invokeMethod('startScan');
    }
  }

  final MethodChannel _methodStop = const MethodChannel('ble_scanner/method');
  Future stopScan() async {
    await _methodStop.invokeMethod('stopScan');
  }

  //events channels
  final EventChannel _event = const EventChannel('ble_scanner/event/devices');
  Stream get stream => _event.receiveBroadcastStream().cast();
}
