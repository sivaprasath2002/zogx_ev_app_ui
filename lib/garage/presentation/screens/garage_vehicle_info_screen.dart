import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/garage/bloc/vehicle_info/vehicle_info_bloc.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/distance_content.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/maintenance_content.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/reports_content.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/timeline_content.dart';

const List<String> carInfoTabbarMap = [
  "Timeline",
  "Reports",
  "Distance",
  "Maintenance",
];

class GarageVehicleInfoScreen extends StatefulWidget {
  final int vehicleId;
  const GarageVehicleInfoScreen({super.key, required this.vehicleId});

  @override
  State<GarageVehicleInfoScreen> createState() =>
      _GarageVehicleInfoScreenState();
}

class _GarageVehicleInfoScreenState extends State<GarageVehicleInfoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VehicleInfoBloc>(context)
        .add(VehicleInfoFetchEvent(widget.vehicleId));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs:
                carInfoTabbarMap.map((screenName) => Text(screenName)).toList(),
          ),
        ),
        body: BlocConsumer<VehicleInfoBloc, VehicleInfoState>(
          builder: (context, state) {
            if (state is VehicleInfoFetchSuccess) {
              return TabBarView(
                children: [
                  TimelineContent(
                    vehicleOverviewModel: state.vehicleOverviewModel,
                  ),
                  const ReportsContent(),
                  const DistanceContent(),
                  MaintenanaceContent(
                    vehicleOverviewModel: state.vehicleOverviewModel,
                  ),
                ],
              );
            } else if (state is VehicleInfoFetchFailure) {
              return Center(
                child: Text(state.error),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
