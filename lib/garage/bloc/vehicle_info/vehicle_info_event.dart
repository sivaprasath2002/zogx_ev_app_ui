part of 'vehicle_info_bloc.dart';

@immutable
sealed class VehicleInfoEvent {}

final class VehicleInfoFetchEvent extends VehicleInfoEvent {
  final int vehicleId;
  VehicleInfoFetchEvent(this.vehicleId);
}
