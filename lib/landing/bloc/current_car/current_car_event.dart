part of 'current_car_bloc.dart';

@immutable
sealed class CurrentCarEvent {}

final class CurrentCarFetchEvent extends CurrentCarEvent {
  final int carId;
  CurrentCarFetchEvent(this.carId);
}
