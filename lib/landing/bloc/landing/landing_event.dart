part of 'landing_bloc.dart';

@immutable
sealed class LandingEvent {}

final class FetchDetailsEvent extends LandingEvent {}
