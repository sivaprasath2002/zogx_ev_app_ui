import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zogx_ev_app_2/landing/model/current_vehicle_model.dart';
import 'package:zogx_ev_app_2/landing/repository/current_vehicle.dart';

part 'current_car_event.dart';
part 'current_car_state.dart';

class CurrentCarBloc extends Bloc<CurrentCarEvent, CurrentCarState> {
  CurrentCarBloc() : super(CurrentCarInitial()) {
    on<CurrentCarFetchEvent>((event, emit) async {
      emit(CurrentCarFetchLoading());
      try {
        final vehicle = await currentVehicleRepo(carId: event.carId);
        emit(CurrentCarFetchSuccess(vehicle));
      } catch (error) {
        emit(CurrentCarFetchFailure(error.toString()));
      }
    });
  }
}
