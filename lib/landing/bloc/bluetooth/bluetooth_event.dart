part of 'bluetooth_bloc.dart';

@immutable
sealed class BluetoothEvent {}

final class BluetoothOnEvent extends BluetoothEvent {}

final class BluetoothOffEvent extends BluetoothEvent {}

final class BluetoothScannedEvent extends BluetoothEvent {
  final List<ScanResult> scannedDevices;
  BluetoothScannedEvent(this.scannedDevices);
}
