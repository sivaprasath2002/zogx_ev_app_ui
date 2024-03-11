import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:location/location.dart' as location;

class TracingMapScreen extends StatefulWidget {
  const TracingMapScreen({super.key});

  @override
  State<TracingMapScreen> createState() => _TracingMapScreenState();
}

class _TracingMapScreenState extends State<TracingMapScreen> {
  LatLng? userCurrentLocation;

  List<LatLng> tracingRoute = [];

  bool isTracingStarted = false;

  final MapController _mapContoller = MapController();

  bool isLocationEnabled = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  @override
  void dispose() {
    _mapContoller.dispose();
    super.dispose();
  }

  void initLocation() {
    location.Location().serviceEnabled().then((isServiceEnabled) {
      setState(() {
        isLocationEnabled = isServiceEnabled;
      });
      getCurrentLocation();
    });
    Geolocator.getServiceStatusStream().listen((serviceStatus) {
      print(serviceStatus);
      if (serviceStatus == ServiceStatus.enabled) {
        getCurrentLocation();
      }
      setState(() {
        isLocationEnabled = serviceStatus == ServiceStatus.enabled;
      });
    });
  }

  void onTacingStart() {
    setState(() {
      isTracingStarted = true;
      tracingRoute = [];
    });
    Geolocator.getCurrentPosition().then((lastPostion) {
      setState(() {
        userCurrentLocation =
            LatLng(lastPostion.latitude, lastPostion.longitude);
        tracingRoute.add(userCurrentLocation!);
      });
    });

    Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.bestForNavigation))
        .listen(
      (position) {
        setState(() {
          userCurrentLocation = LatLng(position.latitude, position.longitude);
          tracingRoute.add(
            LatLng(
              position.latitude,
              position.longitude,
            ),
          );
          _mapContoller.move(userCurrentLocation!, 16);
        });
      },
      cancelOnError: true,
    );
  }

  void getCurrentLocation() {
    try {
      Geolocator.getCurrentPosition().then(
        (position) {
          setState(() {
            userCurrentLocation = LatLng(position.latitude, position.longitude);
          });
          if (userCurrentLocation != null) {
            _mapContoller.move(
              userCurrentLocation!,
              16,
            );
          }
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enable gps",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapContoller,
      options: const MapOptions(
        initialCenter: LatLng(27.5650, 77.6593),
        minZoom: 2,
        initialZoom: 6,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: "io.zogx",
        ),
        if (!isLocationEnabled)
          Padding(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            child: Card(
              color: Theme.of(context).primaryColorDark,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text(
                      "Turn on GPS for accurate location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            kDefaultElevatedButtonRadius,
                          ),
                        ),
                      ),
                      onPressed: getCurrentLocation,
                      child: const Text(
                        "Turn on",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (userCurrentLocation != null)
          MarkerLayer(
            markers: [
              Marker(
                point: userCurrentLocation!,
                child: const Icon(
                  Icons.location_history_rounded,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        if (tracingRoute.isNotEmpty)
          PolylineLayer(
            polylines: [
              Polyline(
                color: Colors.blue,
                strokeWidth: 5,
                points: tracingRoute,
              ),
            ],
          ),
        if (tracingRoute.isNotEmpty)
          MarkerLayer(
            markers: [
              Marker(
                point: tracingRoute.first,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        if (isLocationEnabled)
          Padding(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    IconButton.filled(
                      onPressed: getCurrentLocation,
                      style: const ButtonStyle().copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                      icon: const Icon(Icons.location_searching),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                if (isTracingStarted)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isTracingStarted = false;
                        // tracingRoute = [];
                      });
                    },
                    child: const Text(
                      "Stop tracing",
                    ),
                  ),
                if (!isTracingStarted)
                  FilledButton(
                    onPressed: onTacingStart,
                    child: const Text(
                      "Start tracing",
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
