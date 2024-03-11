import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/plug_availability_table.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/station_image_card.dart';

class OverviewContent extends StatelessWidget {
  final StationOverviewModel stationOverviewModel;
  const OverviewContent({super.key, required this.stationOverviewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(kDefaultAllSidePadding),
          child: Column(
            children: [
              StationImageCard(
                stationOverviewModel: stationOverviewModel,
              ),
              const SizedBox(
                height: kDefaultColumnWidgetSpacing,
              ),
              PlugAvailabilityTable(
                  portDetails: stationOverviewModel.portsInfo),
            ],
          )),
    );
  }
}
