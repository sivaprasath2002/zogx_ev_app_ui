import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:zogx_ev_app_2/landing/model/station_model.dart';

class FavStationCubit extends HydratedCubit<StationModel> {
  FavStationCubit()
      : super(
          StationModel(
            stationId: 0,
            latitude: 0,
            longitude: 0,
            stationName: "",
            stationShortAddress: "",
          ),
        );

  void markAsFavorite({required StationModel station}) {
    emit(station);
  }

  @override
  StationModel? fromJson(Map<String, dynamic> json) {
    final data = json['fav_station'] as Map<String, dynamic>;
    return StationModel(
      stationId: data['stationId'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      stationName: data['stationName'],
      stationShortAddress: data['stationShortAddress'],
    );
  }

  @override
  Map<String, dynamic>? toJson(StationModel state) {
    return {
      'fav_station': {
        'stationId': state.stationId,
        'latitude': state.latitude,
        'longitude': state.longitude,
        'stationName': state.stationName,
        'stationShortAddress': state.stationShortAddress,
      },
    };
  }
}
