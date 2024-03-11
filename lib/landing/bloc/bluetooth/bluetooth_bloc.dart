import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc() : super(BluetoothInitial()) {
    FlutterBluePlus.adapterState.listen((adapterState) {
      if (adapterState == BluetoothAdapterState.on) {
        add(BluetoothOnEvent());
      } else if (adapterState == BluetoothAdapterState.off) {
        add(BluetoothOffEvent());
      }
    });
    FlutterBluePlus.isScanning.listen((event) {
      print(event);
    });
    FlutterBluePlus.scanResults.listen((devices) {
      print(devices);
      add(BluetoothScannedEvent(devices));
    });
    on<BluetoothOnEvent>((event, emit) async {
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
      // FlutterBluePlus.stopScan();
    });
    on<BluetoothScannedEvent>((event, emit) =>
        emit(BluetoothScanFinishedState(event.scannedDevices)));
    on<BluetoothOffEvent>(
        (event, emit) => emit(BluetoothOffState("Bluetooth turned off")));
  }
}
