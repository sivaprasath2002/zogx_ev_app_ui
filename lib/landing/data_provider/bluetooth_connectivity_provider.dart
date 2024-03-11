import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Stream<BluetoothAdapterState> bluetoothStuff() {
  return FlutterBluePlus.adapterState.asBroadcastStream();
}
