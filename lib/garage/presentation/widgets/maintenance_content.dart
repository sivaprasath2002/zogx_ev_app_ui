import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/garage/model/vehicle_overview_model.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/garage_vehicle.dart';

class MaintenanaceContent extends StatelessWidget {
  final VehicleOverviewModel vehicleOverviewModel;
  const MaintenanaceContent({super.key, required this.vehicleOverviewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultAllSidePadding),
      child: Column(
        children: [
          GarageVehicle(
            vehicleId: vehicleOverviewModel.vehicleId,
            imageUrl: vehicleOverviewModel.imageUrl,
            vehicleName: vehicleOverviewModel.vehicleName,
            vehicleModelName: vehicleOverviewModel.vehicleModelName,
            vehicleRegisteredAddress:
                vehicleOverviewModel.vehicleRegisteredAddress,
            isGarage: false,
          ),
          // Row(
          //   children: [
          //     MaintenanceContainer(
          //       icon: Icons.ev_station,
          //       heading: "Range",
          //       subContent: "${vehicleOverviewModel.vehicleRange} mi",
          //     ),
          //     const Spacer(),
          //     MaintenanceContainer(
          //       icon: Icons.battery_charging_full,
          //       heading: "Battery",
          //       subContent:
          //           "Capacity: ${vehicleOverviewModel.vehicleBatteryCapacity}%",
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     MaintenanceContainer(
          //       icon: Icons.battery_saver,
          //       heading: "Battery Change",
          //       subContent:
          //           "${vehicleOverviewModel.vehicleNextBatteryChange} mi",
          //     ),
          //     const Spacer(),
          //     MaintenanceContainer(
          //       icon: Icons.home,
          //       heading: "Service",
          //       subContent: "${vehicleOverviewModel.vehicleNextService} mi",
          //     ),
          //   ],
          // ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultColumnWidgetSpacing,
                crossAxisSpacing: kDefaultColumnWidgetSpacing,
                childAspectRatio: 2,
              ),
              children: [
                MaintenanceContainer(
                  icon: Icons.ev_station,
                  heading: "Range",
                  subContent: "${vehicleOverviewModel.vehicleRange} mi",
                ),
                MaintenanceContainer(
                  icon: Icons.battery_charging_full,
                  heading: "Battery",
                  subContent:
                      "Capacity: ${vehicleOverviewModel.vehicleBatteryCapacity}%",
                ),
                MaintenanceContainer(
                  icon: Icons.battery_saver,
                  heading: "Battery Change",
                  subContent:
                      "${vehicleOverviewModel.vehicleNextBatteryChange} mi",
                ),
                MaintenanceContainer(
                  icon: Icons.home,
                  heading: "Service",
                  subContent: "${vehicleOverviewModel.vehicleNextService} mi",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MaintenanceContainer extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subContent;
  const MaintenanceContainer({
    super.key,
    required this.icon,
    required this.heading,
    required this.subContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          IconButton.filled(
            color: Colors.green,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.black,
              ),
            ),
            onPressed: () {},
            icon: Icon(
              icon,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              Text(
                subContent,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
