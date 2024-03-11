part of 'vehicle_info_bloc.dart';

@immutable
sealed class VehicleInfoState {}

final class VehicleInfoInitial extends VehicleInfoState {}

final class VehicleInfoFetchSuccess extends VehicleInfoState {
  final VehicleOverviewModel vehicleOverviewModel;
  VehicleInfoFetchSuccess(this.vehicleOverviewModel);
}

final class VehicleInfoFetchFailure extends VehicleInfoState {
  final String error;
  VehicleInfoFetchFailure(this.error);
}
