part of 'current_car_bloc.dart';

@immutable
sealed class CurrentCarState {}

final class CurrentCarInitial extends CurrentCarState {}

final class CurrentCarFetchSuccess extends CurrentCarState {
  final CurrentVehicleModel vehicleModel;
  CurrentCarFetchSuccess(this.vehicleModel);
}

final class CurrentCarFetchFailure extends CurrentCarState {
  final String error;
  CurrentCarFetchFailure(this.error);
}

final class CurrentCarFetchLoading extends CurrentCarState {}
