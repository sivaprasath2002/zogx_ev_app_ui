import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/landing/bloc/slots/bloc/slots_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/station_info/bloc/station_info_bloc.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/station_info/station_info_card.dart';

class ReserveContent extends StatelessWidget {
  const ReserveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultAllSidePadding),
        child: BlocBuilder<StationInfoBloc, StationInfoState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(kDefaultClipRRectRadius),
                    child: StationInfoCard(
                      backGroundColor: Theme.of(context).primaryColorDark,
                      stationOverviewModel: state.stationOverviewModel,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultColumnWidgetSpacing,
                  ),
                  CustomDateTimePicker(
                    stationId: state.stationOverviewModel.stationId,
                  ),
                  const SizedBox(
                    height: kDefaultColumnWidgetSpacing,
                  ),
                  AvailableSlotsContainer(
                    stationOverviewModel: state.stationOverviewModel,
                  ),
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
        ),
      ),
    );
  }
}

class AvailableSlotsContainer extends StatefulWidget {
  final StationOverviewModel stationOverviewModel;
  const AvailableSlotsContainer({
    super.key,
    required this.stationOverviewModel,
  });

  @override
  State<AvailableSlotsContainer> createState() =>
      _AvailableSlotsContainerState();
}

class _AvailableSlotsContainerState extends State<AvailableSlotsContainer> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SlotsBloc>(context).add(
      FetchSlotsEvent(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
        widget.stationOverviewModel.stationId,
      ),
    );
  }

  List<String> selectedSlots = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
          child: Container(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            color: Theme.of(context).primaryColorDark,
            child: BlocBuilder<SlotsBloc, SlotsState>(
              builder: (context, state) {
                if (state is SlotsFetchSuccessState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Available slots ${state.slot.slotsOfDay}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultColumnWidgetSpacing,
                      ),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 2,
                        ),
                        children: state.slot.slots
                            .map(
                              (time) => ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  kSlotsButtonRadius,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedSlots.contains(time)) {
                                        selectedSlots.remove(time);
                                      } else {
                                        selectedSlots.add(time);
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: (selectedSlots.contains(time))
                                        ? Colors.green
                                        : Colors.black,
                                    alignment: Alignment.center,
                                    child: Text(
                                      time,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                } else if (state is SlotsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SlotsFetchFailureState) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                return const Center(
                  child: Text("Slots info not available."),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: kDefaultColumnWidgetSpacing,
        ),
        FilledButton(
          onPressed: () {},
          child: const Text(
            "Book",
          ),
        ),
      ],
    );
  }
}

class CustomDateTimePicker extends StatefulWidget {
  final int stationId;
  const CustomDateTimePicker({super.key, required this.stationId});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime pickedDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDateButtonRadius),
      child: Container(
        padding: const EdgeInsets.all(kDefaultAllSidePadding),
        color: Theme.of(context).primaryColorDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${DateFormat.MMMd().format(DateTime.now())} - ${DateFormat.MMMd().format(
                    DateTime.now().add(
                      const Duration(days: 6),
                    ),
                  )}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultColumnWidgetSpacing - 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  7,
                  (index) {
                    final tempDateTime = DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      (index == 0) ? DateTime.now().hour : 0,
                      (index == 0) ? DateTime.now().minute : 0,
                      (index == 0) ? DateTime.now().second : 0,
                      (index == 0) ? DateTime.now().millisecond : 0,
                      (index == 0) ? DateTime.now().microsecond : 0,
                    ).add(Duration(days: index));
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pickedDateTime = tempDateTime;
                          });
                          BlocProvider.of<SlotsBloc>(context)
                              .add(FetchSlotsEvent(
                            pickedDateTime,
                            widget.stationId,
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: (pickedDateTime.day == tempDateTime.day)
                              ? Colors.green
                              : Colors.black,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            (tempDateTime.day <= 9)
                                ? "0${tempDateTime.day}"
                                : tempDateTime.day.toString(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
