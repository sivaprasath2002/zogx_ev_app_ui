part of 'garage_vehicle_bloc.dart';

@immutable
sealed class GarageVehicleEvent {}

final class GarageVehicleFetchEvent extends GarageVehicleEvent {
  final int userId;
  GarageVehicleFetchEvent(this.userId);
}
