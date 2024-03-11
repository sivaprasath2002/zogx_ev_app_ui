import 'package:zogx_ev_app_2/landing/data_provider/current_vehicle_provider.dart';
import 'package:zogx_ev_app_2/landing/model/current_vehicle_model.dart';

Future<CurrentVehicleModel> currentVehicleRepo({required int carId}) async {
  final data = await currentVehicleProvider(carId: carId);
  return CurrentVehicleModel.fromMap(data);
}
