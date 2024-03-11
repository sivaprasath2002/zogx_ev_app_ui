import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/common/routes/assets/geofencing_assets_route.dart';

enum GeoFencingMode {
  circle,
  polygon,
}

class GeofencingMapScreen extends StatefulWidget {
  const GeofencingMapScreen({super.key});

  @override
  State<GeofencingMapScreen> createState() => _GeofencingMapScreenState();
}

class _GeofencingMapScreenState extends State<GeofencingMapScreen> {
  final MapController _mapController = MapController();
  final _radiusFormKey = GlobalKey<FormState>();
  double enteredRadius = 0.0;
  List<LatLng> polygonPoints = [];
  LatLng? pickedPoint;
  GeoFencingMode currentGeofencingMode = GeoFencingMode.circle;

  @override
  void dispose() {
    _mapController.dispose();

    super.dispose();
  }

  void getCurrentLocation() {
    Geolocator.getCurrentPosition().then((currentPosition) {
      setState(() {
        pickedPoint =
            LatLng(currentPosition.latitude, currentPosition.longitude);
      });
      _mapController.move(
        pickedPoint!,
        16,
      );
    });
  }

  void onNewMode(GeoFencingMode newMode) {
    if (newMode == currentGeofencingMode) {
      return;
    }
    setState(() {
      pickedPoint == null;
      polygonPoints = [];
      enteredRadius = 0.0;
      currentGeofencingMode = newMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(27.5650, 77.6593),
        minZoom: 2,
        initialZoom: 6,
        onTap: (tapPosition, point) {
          if (pickedPoint == null ||
              currentGeofencingMode == GeoFencingMode.circle) {
            setState(() {
              pickedPoint = point;
            });
          } else if (currentGeofencingMode == GeoFencingMode.polygon) {
            setState(() {
              polygonPoints.add(point);
            });
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: "io.zogx",
        ),
        if (pickedPoint != null)
          MarkerLayer(
            markers: [
              Marker(
                point: pickedPoint!,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        if (pickedPoint != null &&
            enteredRadius > 0 &&
            currentGeofencingMode == GeoFencingMode.circle)
          CircleLayer(
            circles: [
              CircleMarker(
                point: pickedPoint!,
                radius: enteredRadius,
                useRadiusInMeter: true,
                borderColor: Colors.blueAccent,
                borderStrokeWidth: 2,
                color: const Color.fromARGB(125, 64, 195, 255),
              ),
            ],
          ),
        if (pickedPoint != null &&
            currentGeofencingMode == GeoFencingMode.polygon &&
            polygonPoints.length >= 3)
          PolygonLayer(
            polygons: [
              Polygon(
                points: polygonPoints,
                isFilled: true,
                borderColor: Colors.blueAccent,
                borderStrokeWidth: 2,
                color: const Color.fromARGB(125, 64, 195, 255),
              ),
            ],
          ),
        if (pickedPoint != null &&
            currentGeofencingMode == GeoFencingMode.polygon)
          MarkerLayer(
            markers: polygonPoints
                .map(
                  (latLng) => Marker(
                    point: latLng,
                    child: const Icon(
                      Icons.circle,
                      color: Colors.black87,
                    ),
                  ),
                )
                .toList(),
          ),
        Padding(
          padding: const EdgeInsets.all(kDefaultAllSidePadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration().copyWith(
                    filled: true,
                    hintText: "Enter a place",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton.filled(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                      ),
                      onPressed: getCurrentLocation,
                      icon: const Icon(
                        Icons.location_searching,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                if (currentGeofencingMode == GeoFencingMode.polygon &&
                    polygonPoints.length < 3)
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(kDefaultInputFieldRadius),
                    child: Container(
                      color: Theme.of(context).primaryColorDark,
                      padding: const EdgeInsets.all(kDefaultAllSidePadding),
                      child: Text(
                        "Pick ${3 - polygonPoints.length} more points to draw geo-fencing layer",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                      ),
                    ),
                  ),
                if (currentGeofencingMode == GeoFencingMode.circle)
                  Form(
                    key: _radiusFormKey,
                    child: TextFormField(
                      decoration: const InputDecoration().copyWith(
                        filled: true,
                        hintText: "Enter geofencing radius in meters",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (radiusString) {
                        if (radiusString == null ||
                            radiusString.trim().isEmpty ||
                            double.tryParse(radiusString.trim()) == null) {
                          return "Enter a valid geofencing radius";
                        }
                        return null;
                      },
                      onFieldSubmitted: (radius) {
                        if (_radiusFormKey.currentState?.validate() ?? false) {
                          setState(() {
                            enteredRadius = double.parse(radius);
                          });
                        }
                      },
                    ),
                  ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                GeoFencingModeSelector(
                  mode: currentGeofencingMode,
                  onModeTap: onNewMode,
                ),
                FilledButton(
                  onPressed: () {
                    if (pickedPoint == null || enteredRadius <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Can't make geofencing without a marker and radius"),
                        ),
                      );
                      return;
                    }
                  },
                  child: const Text(
                    "Start",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GeoFencingModeSelector extends StatelessWidget {
  final GeoFencingMode mode;
  final void Function(GeoFencingMode) onModeTap;
  const GeoFencingModeSelector({
    super.key,
    required this.mode,
    required this.onModeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultAllSidePadding),
        child: Column(
          children: [
            Text(
              "Select your preferred geofencing type",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: kDefaultColumnWidgetSpacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeofencingModeContainer(
                  imageRoute: geofencingOvalImageAssetRoute,
                  shape: GeoFencingMode.circle,
                  isSelected: mode == GeoFencingMode.circle,
                  onModeTap: onModeTap,
                ),
                GeofencingModeContainer(
                  imageRoute: geofencingHexagonImageAssetRoute,
                  shape: GeoFencingMode.polygon,
                  isSelected: mode == GeoFencingMode.polygon,
                  onModeTap: onModeTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GeofencingModeContainer extends StatelessWidget {
  final String imageRoute;
  final GeoFencingMode shape;
  final bool isSelected;
  final void Function(GeoFencingMode) onModeTap;
  const GeofencingModeContainer(
      {super.key,
      required this.imageRoute,
      required this.shape,
      required this.isSelected,
      required this.onModeTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onModeTap(shape);
      },
      child: Image.asset(
        imageRoute,
        fit: BoxFit.fill,
        width: 50,
        color: (isSelected) ? Colors.green : Colors.grey,
      ),
    );
  }
}
