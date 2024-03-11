part of 'slots_bloc.dart';

@immutable
sealed class SlotsState {}

final class SlotsInitial extends SlotsState {}

final class SlotsFetchSuccessState extends SlotsState {
  final SlotModel slot;
  SlotsFetchSuccessState(this.slot);
}

final class SlotsFetchFailureState extends SlotsState {
  final String error;
  SlotsFetchFailureState(this.error);
}

final class SlotsLoadingState extends SlotsState {}
