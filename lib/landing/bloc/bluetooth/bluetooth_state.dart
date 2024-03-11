part of 'bluetooth_bloc.dart';

@immutable
sealed class BluetoothState {}

final class BluetoothInitial extends BluetoothState {}

final class BluetoothOnState extends BluetoothState {
  final List<BluetoothDevice> connectedDevices;
  BluetoothOnState(this.connectedDevices);
}

final class BluetoothScanFinishedState extends BluetoothState {
  final List<ScanResult> scannedDevices;
  BluetoothScanFinishedState(this.scannedDevices);
}

final class BluetoothOffState extends BluetoothState {
  final String message;
  BluetoothOffState(this.message);
}
