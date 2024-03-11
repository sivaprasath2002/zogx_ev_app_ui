part of 'station_info_bloc.dart';

@immutable
sealed class StationInfoEvent {}

final class FetchStationInfoEvent extends StationInfoEvent {
  final int stationId;
  FetchStationInfoEvent(this.stationId);
}
