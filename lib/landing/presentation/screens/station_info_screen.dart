import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/station_info/bloc/station_info_bloc.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/overview_content.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/reserve_content.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/reviews_content.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/start_content.dart';

const List<String> stationTabbarMap = [
  "Overview",
  "Start",
  "Reserve",
  "Reviews",
];

class StationInfoScreen extends StatefulWidget {
  final int stationId;
  const StationInfoScreen({super.key, required this.stationId});

  @override
  State<StationInfoScreen> createState() => _StationInfoScreenState();
}

class _StationInfoScreenState extends State<StationInfoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StationInfoBloc>(context)
        .add(FetchStationInfoEvent(widget.stationId));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs:
                stationTabbarMap.map((screenName) => Text(screenName)).toList(),
          ),
        ),
        body: BlocConsumer<StationInfoBloc, StationInfoState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return TabBarView(
                children: [
                  OverviewContent(
                    stationOverviewModel: state.stationOverviewModel,
                  ),
                  const StartContent(),
                  const ReserveContent(),
                  const ReviewsContent(),
                ],
              );
            } else if (state is FailureState) {
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
