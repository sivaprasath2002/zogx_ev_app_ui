import 'package:flutter/widgets.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/garage/model/vehicle_overview_model.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/garage_vehicle.dart';

class TimelineContent extends StatelessWidget {
  final VehicleOverviewModel vehicleOverviewModel;
  const TimelineContent({super.key, required this.vehicleOverviewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultAllSidePadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GarageVehicle(
              vehicleId: vehicleOverviewModel.vehicleId,
              imageUrl: vehicleOverviewModel.imageUrl,
              vehicleName: vehicleOverviewModel.vehicleName,
              vehicleModelName: vehicleOverviewModel.vehicleModelName,
              batteryPercent: vehicleOverviewModel.vehicleCurrentBattery,
              isGarage: false,
            ),
          ],
        ),
      ),
    );
  }
}
