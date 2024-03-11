import 'package:zogx_ev_app_2/landing/model/user_location_model.dart';
import 'package:zogx_ev_app_2/landing/model/vehicle_model.dart';

class LandingModel {
  final String name;
  final VehicleModel? vehicleModel;
  final UserLocationModel? userCurrentLocation;
  const LandingModel(
      {required this.name, this.userCurrentLocation, this.vehicleModel});
}
