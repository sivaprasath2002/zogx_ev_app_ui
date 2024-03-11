part of 'station_info_bloc.dart';

@immutable
sealed class StationInfoState {}

final class StationInfoInitial extends StationInfoState {}

final class LoadingStationInfo extends StationInfoState {}

final class SuccessState extends StationInfoState {
  final StationOverviewModel stationOverviewModel;
  SuccessState(this.stationOverviewModel);
}

final class FailureState extends StationInfoState {
  final String error;
  FailureState(this.error);
}
