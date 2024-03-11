import 'package:zogx_ev_app_2/garage/data_provider/vehicle_overview_provider.dart';
import 'package:zogx_ev_app_2/garage/model/vehicle_overview_model.dart';

Future<VehicleOverviewModel> vehicleOverviewRepo(
    {required int vehicleId}) async {
  final data = await vehicleOverviewProvider(vehicleId: vehicleId);
  return VehicleOverviewModel.fromMap(data);
}
