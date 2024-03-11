part of 'nearby_stations_bloc.dart';

@immutable
sealed class NearbyStationsEvent {}

final class FetchNearbyStationsEvent extends NearbyStationsEvent {}
