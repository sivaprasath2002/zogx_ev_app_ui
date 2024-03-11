import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
// import 'package:zogx_ev_app_2/common/routes/network/reserve_endpoints.dart';

Future<String> getSlotsAvailable({
  required DateTime dateTime,
  required int stationId,
}) async {
  // final dio = Dio();
  // final response = await dio.get(
  //   "$slotsEndpoint?station_id=$stationId&date_time=$dateTime",
  // );
  // print(response.statusCode);
  /**
   * TODO this is a mock slots provider
   */
  await Future.delayed(const Duration(seconds: 2));
  final data = jsonEncode({
    "slotsOfDay": DateFormat("dd.MM.y").format(dateTime),
    "slots": [
      DateFormat("hh:mm a")
          .format(DateTime.now().add(const Duration(hours: 1))),
      DateFormat("hh:mm a")
          .format(DateTime.now().add(const Duration(hours: 2))),
      DateFormat("hh:mm a")
          .format(DateTime.now().add(const Duration(hours: 3))),
      DateFormat("hh:mm a")
          .format(DateTime.now().add(const Duration(hours: 4))),
      DateFormat("hh:mm a")
          .format(DateTime.now().add(const Duration(hours: 5))),
    ]
  });
  print(data);
  return data;
}
