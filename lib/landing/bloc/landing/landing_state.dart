part of 'landing_bloc.dart';

@immutable
sealed class LandingState {}

final class LandingInitial extends LandingState {}

final class LocationServiceDisabledState extends LandingState {}

final class LoadingState extends LandingState {}

final class SuccessState extends LandingState {}
