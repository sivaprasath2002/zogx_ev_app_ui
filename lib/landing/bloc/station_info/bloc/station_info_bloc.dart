import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zogx_ev_app_2/landing/data_provider/station_info_provider.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';

part 'station_info_event.dart';
part 'station_info_state.dart';

class StationInfoBloc extends Bloc<StationInfoEvent, StationInfoState> {
  StationInfoBloc() : super(StationInfoInitial()) {
    on<FetchStationInfoEvent>((event, emit) async {
      emit(LoadingStationInfo());
      try {
        final stationOverviewModel =
            await stationInfoProvider(stationId: event.stationId);
        emit(SuccessState(stationOverviewModel));
      } catch (error) {
        emit(FailureState(error.toString()));
      }
    });
  }
}
