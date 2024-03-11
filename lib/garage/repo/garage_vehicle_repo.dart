import 'package:zogx_ev_app_2/garage/data_provider/garage_vehivle_provider.dart';
import 'package:zogx_ev_app_2/garage/model/garage_vehicle_model.dart';

Future<List<GarageVehicleModel>> garageVehicleRepo(
    {required int userId}) async {
  final data = await garageVehicleProvider(userId: userId);
  return data.map((vehicle) => GarageVehicleModel.fromMap(vehicle)).toList();
}
