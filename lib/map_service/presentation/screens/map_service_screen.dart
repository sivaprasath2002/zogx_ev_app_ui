import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/geofencing/presentation/screens/geofencing_map_screen.dart';
import 'package:zogx_ev_app_2/tracing/presentation/screens/tracing_map_screen.dart';

class MapServiceScreen extends StatelessWidget {
  const MapServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Text(
              "Geofencing",
            ),
            Text(
              "Tracing",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            GeofencingMapScreen(),
            TracingMapScreen(),
          ],
        ),
      ),
    );
  }
}
