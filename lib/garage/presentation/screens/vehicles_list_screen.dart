import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/garage/bloc/garage_vehicle/garage_vehicle_bloc.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/garage_vehicle.dart';

class VehicleListScreen extends StatefulWidget {
  final Function? callback;
  final bool isGarage;
  const VehicleListScreen({super.key, this.callback, this.isGarage = true});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GarageVehicleBloc>(context).add(GarageVehicleFetchEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GarageVehicleBloc, GarageVehicleState>(
        builder: (context, state) {
          if (state is GarageVehicleFetchFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is GarageVehicleFetchSuccess) {
            return Padding(
              padding: const EdgeInsets.all(kDefaultAllSidePadding),
              child: SingleChildScrollView(
                child: Column(
                  children: state.garageVehicles
                      .map(
                        (vehicle) => GarageVehicle(
                          vehicleId: vehicle.vehicleId,
                          imageUrl: vehicle.imageUrl,
                          vehicleName: vehicle.vehicleName,
                          vehicleModelName: vehicle.vehicleModelName,
                          batteryPercent: vehicle.batteryPercent,
                          callback: widget.callback,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: (widget.isGarage)
          ? FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              tooltip: "Add vehicle",
              onPressed: () {},
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      floatingActionButtonLocation: (widget.isGarage)
          ? FloatingActionButtonLocation.miniCenterFloat
          : null,
    );
  }
}
