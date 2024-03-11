import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zogx_ev_app_2/landing/model/slot_model.dart';
import 'package:zogx_ev_app_2/landing/repository/slots_repo.dart';

part 'slots_event.dart';
part 'slots_state.dart';

class SlotsBloc extends Bloc<SlotsEvent, SlotsState> {
  SlotsBloc() : super(SlotsInitial()) {
    on<FetchSlotsEvent>((event, emit) async {
      emit(SlotsLoadingState());
      debugPrint(event.dateTime.toIso8601String());
      try {
        final slotModel = await slotsAvailableRepo(
            dateTime: event.dateTime, stationId: event.stationId);
        emit(SlotsFetchSuccessState(slotModel));
      } catch (error) {
        emit(
          SlotsFetchFailureState(
            error.toString().replaceAll(
                  RegExp("Exception:"),
                  "",
                ),
          ),
        );
      }
    });
  }
}
