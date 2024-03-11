import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

Future<LatLng> getUserCurrentLocation() async {
  final userCurrentPosition = await Geolocator.getCurrentPosition();
  return LatLng(userCurrentPosition.latitude, userCurrentPosition.longitude);
}
