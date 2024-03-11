import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';

class GarageVehicle extends StatelessWidget {
  final int vehicleId;
  final String imageUrl;
  final String vehicleName;
  final String vehicleModelName;
  final String? batteryPercent;
  final String? vehicleRegisteredAddress;
  final Function? callback;
  final bool isGarage;
  const GarageVehicle({
    super.key,
    required this.vehicleId,
    required this.imageUrl,
    required this.vehicleName,
    required this.vehicleModelName,
    this.batteryPercent,
    this.vehicleRegisteredAddress,
    this.isGarage = true,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultColumnWidgetSpacing),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
        child: Container(
          padding: const EdgeInsets.all(
            kDefaultAllSidePadding,
          ),
          color: Theme.of(context).primaryColorDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.45,
                height: 75,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicleName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    vehicleModelName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: kDefaultVehicleCardColumnSpacing,
                  ),
                  if (vehicleRegisteredAddress != null)
                    Text(
                      vehicleRegisteredAddress!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  if (vehicleRegisteredAddress == null)
                    Row(
                      children: [
                        Text(
                          "Battery: ",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          "$batteryPercent%",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                        ),
                      ],
                    ),
                ],
              ),
              // SizedBox(
              //   height: 75,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              // Text(
              //   vehicleName,
              //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              // ),
              // Text(
              //   vehicleModelName,
              //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //         color: Colors.grey,
              //       ),
              // ),
              // if (vehicleRegisteredAddress != null)
              //   Text(
              //     vehicleRegisteredAddress!,
              //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //           color: Colors.grey,
              //         ),
              //   ),
              // if (vehicleRegisteredAddress == null)
              //   Row(
              //     children: [
              //       Text(
              //         "Battery: ",
              //         style: Theme.of(context)
              //             .textTheme
              //             .titleSmall
              //             ?.copyWith(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //       ),
              //       Text(
              //         "$batteryPercent%",
              //         style: Theme.of(context)
              //             .textTheme
              //             .titleSmall
              //             ?.copyWith(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.green,
              //             ),
              //       ),
              //     ],
              //   ),
              //     ],
              //   ),
              // ),
              if (isGarage)
                IconButton(
                  onPressed: (callback != null)
                      ? () {
                          callback!(vehicleId);
                        }
                      : () {
                          Navigator.of(context).pushNamed(
                            carInfoScreenRoute,
                            arguments: vehicleId,
                          );
                        },
                  icon: const Icon(Icons.navigate_next),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
