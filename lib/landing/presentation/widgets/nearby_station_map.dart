import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:zogx_ev_app_2/common/design/coordinates.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/landing/bloc/nearby_stations/nearby_stations_bloc.dart';

class NearbyStationMap extends StatefulWidget {
  const NearbyStationMap({super.key});

  @override
  State<NearbyStationMap> createState() => _NearbyStationMapState();
}

class _NearbyStationMapState extends State<NearbyStationMap> {
  late MapController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MapController();
    BlocProvider.of<NearbyStationsBloc>(context)
        .add(FetchNearbyStationsEvent());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
        child: BlocConsumer<NearbyStationsBloc, NearbyStationsState>(
          builder: (context, state) {
            return FlutterMap(
              mapController: _controller,
              options: const MapOptions(
                initialCenter: initialCenter,
                minZoom: 2,
                initialZoom: 6,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: "io.zogx",
                ),
                if (state is SuccessFullyFetchedState)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: state.userCurrentLocation,
                        child: const Icon(
                          Icons.navigation,
                          color: Colors.blue,
                        ),
                      ),
                      ...state.nearbyStations.map<Marker>(
                        (station) => Marker(
                          point: LatLng(station.latitude, station.longitude),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                stationInfoScreenRoute,
                                arguments: station.stationId,
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.ev_station,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultAllSidePadding),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          (state is LoadingNearbyStationsState)
                              ? const CircularProgressIndicator(
                                  backgroundColor: Colors.grey,
                                  color: Colors.blue,
                                )
                              : IconButton.filled(
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<NearbyStationsBloc>(context)
                                        .add(FetchNearbyStationsEvent());
                                  },
                                  icon: const Icon(
                                    Icons.location_searching,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {
            if (state is FetchFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            } else if (state is SuccessFullyFetchedState) {
              _controller.move(
                state.userCurrentLocation,
                10,
              );
            }
          },
        ),
      ),
    );
  }
}
