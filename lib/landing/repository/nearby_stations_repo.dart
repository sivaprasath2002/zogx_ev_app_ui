import 'package:zogx_ev_app_2/landing/data_provider/nearby_stations_provider.dart';
import 'package:zogx_ev_app_2/landing/model/station_model.dart';

Future<List<StationModel>> nearbyStationRepo(
    {required double latitude, required double longitude}) async {
  final data = await getNearbyStation(latitude: latitude, longitude: longitude);
  return List<StationModel>.generate(data.length,
          (index) => StationModel.fromMap(data[index] as Map<String, dynamic>))
      .toList();
}
