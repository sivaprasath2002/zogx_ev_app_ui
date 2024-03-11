import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';

class StationInfoCard extends StatelessWidget {
  final StationOverviewModel stationOverviewModel;
  final Gradient? backgroundGradient;
  final Color? backGroundColor;
  const StationInfoCard({
    super.key,
    required this.stationOverviewModel,
    this.backgroundGradient,
    this.backGroundColor,
  });

  void makeCall(String phone) async {
    var url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildStar(int index, double rating) {
    Widget star = const Icon(
      Icons.star,
      color: Colors.greenAccent,
      size: 16,
    );
    if (index >= rating) {
      star = const Icon(
        Icons.star,
        color: Colors.grey,
        size: 16,
      );
    } else if (index > rating - 1 && index < rating) {
      star = const Icon(
        Icons.star_half,
        color: Colors.greenAccent,
        size: 16,
      );
    }
    return star;
  }

  Widget getAmountAndPlugRemainRow(BuildContext context) {
    return Row(
      children: [
        Text(
          stationOverviewModel.chargePer100V,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.green),
        ),
        Text(
          "/100v",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        ),
        const VerticalDivider(),
        Text(
          stationOverviewModel.stationPlugsFree,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.green),
        ),
        Text(
          " ports",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: backGroundColor,
        gradient: backgroundGradient,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ...List.generate(
                5,
                (index) => buildStar(
                  index,
                  stationOverviewModel.rating,
                ),
              ),
              const Spacer(),
              getAmountAndPlugRemainRow(context),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                stationOverviewModel.stationName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stationOverviewModel.stationShortAddress,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  makeCall(stationOverviewModel.stationContactNumber);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.green,
                    ),
                    const VerticalDivider(),
                    Text(
                      stationOverviewModel.stationContactNumber,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
