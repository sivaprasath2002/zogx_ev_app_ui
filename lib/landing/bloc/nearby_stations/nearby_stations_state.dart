part of 'nearby_stations_bloc.dart';

@immutable
sealed class NearbyStationsState {}

final class NearbyStationsInitial extends NearbyStationsState {}

final class SuccessFullyFetchedState extends NearbyStationsState {
  final LatLng userCurrentLocation;
  final List<StationModel> nearbyStations;
  SuccessFullyFetchedState(
      {required this.nearbyStations, required this.userCurrentLocation});
}

final class FetchFailureState extends NearbyStationsState {
  final String error;
  FetchFailureState(this.error);
}

final class LoadingNearbyStationsState extends NearbyStationsState {}
