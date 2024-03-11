import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/garage/presentation/screens/vehicles_list_screen.dart';
import 'package:zogx_ev_app_2/garage/presentation/widgets/garage_vehicle.dart';
import 'package:zogx_ev_app_2/landing/bloc/current_car/current_car_bloc.dart';
import 'package:zogx_ev_app_2/landing/cubit/current_vehicle_cubit.dart';

class CurrentVehicleCard extends StatefulWidget {
  const CurrentVehicleCard({super.key});

  @override
  State<CurrentVehicleCard> createState() => _CurrentVehicleCardState();
}

class _CurrentVehicleCardState extends State<CurrentVehicleCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentVehicleCubit, int>(
      builder: (context, state) {
        Widget content = Padding(
          padding: const EdgeInsets.only(bottom: kDefaultColumnWidgetSpacing),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
            child: Container(
              padding: const EdgeInsets.all(kDefaultAllSidePadding),
              color: Theme.of(context).primaryColorDark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No vehicle selected yet",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const GarageScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.navigate_next),
                  ),
                ],
              ),
            ),
          ),
        );
        if (state != 0) {
          content = CustomCard(
            currentVehicleId: state,
          );
        }
        return content;
      },
    );
  }
}

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VehicleListScreen(
        isGarage: false,
        callback: (int currentVehicleId) {
          BlocProvider.of<CurrentVehicleCubit>(context)
              .changeCurrentVehicle(currentVehicleId);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int currentVehicleId;
  const CustomCard({super.key, required this.currentVehicleId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CurrentCarBloc>(context).add(
      CurrentCarFetchEvent(currentVehicleId),
    );
    return BlocBuilder<CurrentCarBloc, CurrentCarState>(
      builder: (context, state) {
        if (state is CurrentCarFetchSuccess) {
          return GarageVehicle(
            vehicleId: state.vehicleModel.vehicleId,
            imageUrl: state.vehicleModel.imageUrl,
            vehicleName: state.vehicleModel.vehicleName,
            vehicleModelName: state.vehicleModel.vehicleModelName,
            batteryPercent: state.vehicleModel.batteryPercent,
            callback: (int dummy) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GarageScreen(),
                ),
              );
            },
          );
        }
        Widget content = const CircularProgressIndicator();
        if (state is CurrentCarFetchFailure) {
          content = Text(state.error);
        }
        if (state is CurrentCarFetchLoading) {
          content = const CircularProgressIndicator();
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
          child: Container(
            margin: const EdgeInsets.all(kDefaultColumnWidgetSpacing),
            color: Theme.of(context).primaryColorDark,
            height: 75,
            child: Center(
              child: content,
            ),
          ),
        );
      },
    );
  }
}
