part of 'garage_vehicle_bloc.dart';

@immutable
sealed class GarageVehicleState {}

final class GarageVehicleInitial extends GarageVehicleState {}

final class GarageVehicleFetchSuccess extends GarageVehicleState {
  final List<GarageVehicleModel> garageVehicles;
  GarageVehicleFetchSuccess(this.garageVehicles);
}

final class GarageVehicleFetchFailure extends GarageVehicleState {
  final String error;
  GarageVehicleFetchFailure(this.error);
}
