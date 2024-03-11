part of 'slots_bloc.dart';

@immutable
sealed class SlotsEvent {}

final class FetchSlotsEvent extends SlotsEvent {
  final DateTime dateTime;
  final int stationId;
  FetchSlotsEvent(this.dateTime, this.stationId);
}
