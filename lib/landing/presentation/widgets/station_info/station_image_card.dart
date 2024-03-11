import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/landing/cubit/fav_station_cubit_cubit.dart';
import 'package:zogx_ev_app_2/landing/model/station_model.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/station_info_card.dart';

class StationImageCard extends StatelessWidget {
  final StationOverviewModel stationOverviewModel;
  const StationImageCard({super.key, required this.stationOverviewModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
        ),
        child: Stack(
          children: [
            Image.network(
              "https://images.squarespace-cdn.com/content/v1/5f3b08d4515c242514c95656/f7890c9c-7fcc-439b-b285-5d1328b375c1/commercial-ev-charging-station.jpg,",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Positioned(
              right: kStationLikeButtonPositionPadding,
              top: kStationLikeButtonPositionPadding,
              child: BlocBuilder<FavStationCubit, StationModel>(
                builder: (context, state) {
                  return IconButton.filled(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        (state.stationId == stationOverviewModel.stationId)
                            ? Colors.pink
                            : Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      if (stationOverviewModel.stationId == state.stationId) {
                        BlocProvider.of<FavStationCubit>(context)
                            .markAsFavorite(
                          station: StationModel(
                            stationId: 0,
                            latitude: 0,
                            longitude: 0,
                            stationName: "",
                            stationShortAddress: "",
                          ),
                        );
                      } else {
                        BlocProvider.of<FavStationCubit>(context)
                            .markAsFavorite(
                          station: StationModel(
                            stationId: stationOverviewModel.stationId,
                            latitude: stationOverviewModel.latitude,
                            longitude: stationOverviewModel.longitude,
                            stationName: stationOverviewModel.stationName,
                            stationShortAddress:
                                stationOverviewModel.stationShortAddress,
                          ),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: StationInfoCard(
                stationOverviewModel: stationOverviewModel,
                backgroundGradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(141, 0, 0, 0),
                    Color.fromARGB(178, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
