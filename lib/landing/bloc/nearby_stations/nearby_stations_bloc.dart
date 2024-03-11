import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:zogx_ev_app_2/landing/data_provider/location_data_provider.dart';
import 'package:zogx_ev_app_2/landing/data_provider/nearby_stations_provider.dart';
import 'package:zogx_ev_app_2/landing/model/station_model.dart';
import 'package:zogx_ev_app_2/landing/repository/nearby_stations_repo.dart';

part 'nearby_stations_event.dart';
part 'nearby_stations_state.dart';

class NearbyStationsBloc
    extends Bloc<NearbyStationsEvent, NearbyStationsState> {
  NearbyStationsBloc() : super(NearbyStationsInitial()) {
    on<FetchNearbyStationsEvent>(
      _onFetchNearbyStationsEvent,
    );
  }

  void _onFetchNearbyStationsEvent(
    FetchNearbyStationsEvent event,
    Emitter<NearbyStationsState> emit,
  ) async {
    emit(LoadingNearbyStationsState());
    try {
      final userCurrentLocation = await getUserCurrentLocation();
      final nearbyStations = await nearbyStationRepo(
          latitude: userCurrentLocation.latitude,
          longitude: userCurrentLocation.longitude);
      emit(SuccessFullyFetchedState(
          nearbyStations: nearbyStations,
          userCurrentLocation: userCurrentLocation));
    } catch (error) {
      emit(FetchFailureState(error.toString()));
    }
  }

  @override
  void onTransition(
      Transition<NearbyStationsEvent, NearbyStationsState> transition) {
    super.onTransition(transition);
    print(transition.toString());
  }
}
