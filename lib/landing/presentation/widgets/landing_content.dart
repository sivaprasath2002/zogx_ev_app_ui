import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/landing/cubit/fav_station_cubit_cubit.dart';
import 'package:zogx_ev_app_2/landing/model/station_model.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/current_vehicle_card.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/nearby_station_map.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const VehicleWidget();
  }
}

class VehicleWidget extends StatelessWidget {
  const VehicleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(kDefaultAllSidePadding),
        child: Column(
          children: [
            CurrentVehicleCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeedometerContainer(),
                FavStationContainer(),
              ],
            ),
            SizedBox(
              height: kDefaultColumnWidgetSpacing,
            ),
            NearbyStationMap(),
          ],
        ),
      ),
    );
  }
}

class SpeedometerContainer extends StatelessWidget {
  const SpeedometerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
      child: Container(
        padding: const EdgeInsets.all(kDefaultAllSidePadding),
        color: Theme.of(context).primaryColorDark,
        child: RichText(
          text: TextSpan(
            text: "88",
            style: GoogleFonts.orbitron().copyWith(
              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
            ),
            children: [
              TextSpan(
                text: "km/h",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavStationContainer extends StatelessWidget {
  const FavStationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavStationCubit, StationModel>(
      builder: (context, state) {
        Widget content = Text(
          "Add a station",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        );
        if (BlocProvider.of<FavStationCubit>(context).state.stationId != 0) {
          content = Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    state.stationName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    state.stationShortAddress,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          );
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
          child: Container(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            color: Theme.of(context).primaryColorDark,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.ev_station,
                    ),
                    const VerticalDivider(),
                    Text(
                      "Favorite station",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                content,
              ],
            ),
          ),
        );
      },
    );
  }
}
