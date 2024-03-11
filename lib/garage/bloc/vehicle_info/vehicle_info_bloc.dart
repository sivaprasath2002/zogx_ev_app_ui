import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zogx_ev_app_2/garage/model/vehicle_overview_model.dart';
import 'package:zogx_ev_app_2/garage/repo/vehicle_overview_repo.dart';

part 'vehicle_info_event.dart';
part 'vehicle_info_state.dart';

class VehicleInfoBloc extends Bloc<VehicleInfoEvent, VehicleInfoState> {
  VehicleInfoBloc() : super(VehicleInfoInitial()) {
    on<VehicleInfoFetchEvent>((event, emit) async {
      final vehicleOverviewModel =
          await vehicleOverviewRepo(vehicleId: event.vehicleId);
      emit(VehicleInfoFetchSuccess(vehicleOverviewModel));
    });
  }
}
