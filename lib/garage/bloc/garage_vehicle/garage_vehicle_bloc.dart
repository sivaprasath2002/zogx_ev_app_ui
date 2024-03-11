import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zogx_ev_app_2/garage/model/garage_vehicle_model.dart';
import 'package:zogx_ev_app_2/garage/repo/garage_vehicle_repo.dart';

part 'garage_vehicle_event.dart';
part 'garage_vehicle_state.dart';

class GarageVehicleBloc extends Bloc<GarageVehicleEvent, GarageVehicleState> {
  GarageVehicleBloc() : super(GarageVehicleInitial()) {
    on<GarageVehicleFetchEvent>((event, emit) async {
      try {
        final vehicles = await garageVehicleRepo(userId: event.userId);
        emit(
          GarageVehicleFetchSuccess(
            vehicles,
          ),
        );
      } catch (error) {
        emit(
          GarageVehicleFetchFailure(
            error.toString(),
          ),
        );
      }
    });
  }
}
