import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:zogx_ev_app_2/common/routes/network/station_info_endpoints.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';

void printUtil(MapEntry element) {
  print("${element.value} - ${element.value.runtimeType}");
}

Future<StationOverviewModel> stationInfoProvider(
    {required int stationId}) async {
  // Dio dio = Dio();
  // final response = await dio.get(
  //   stationInfoEndpoint,
  //   queryParameters: {
  //     'station-id': stationId,
  //   },
  // );
  // if (response.statusCode != 200) {
  //   throw Exception("Internal server error");
  // }
  // final data = response.data?['data'] as Map<String, dynamic>;

  // data.entries.forEach(printUtil);
  /**
   * TODO this is a mock station overview api
   * 
   * model data
   * 'stationId': stationId
      'stationName': "Tesla station",
      'rating': 3.5
      'stationShortAddress': "Hanover St. 24",
      'chargePer100V': "$60/100",
      'stationPlugsFree': "8/10",
      'stationContactNumber': "+1234567890",
      'portsInfo': [
        {
          'portType': "Type 1",
          'portsAvailable': 2,
          'totalnumberOfPorts': 3,
          'price': "Free",
        },
        {
          'portType': "Chademo",
          'portsAvailable': 4,
          'totalnumberOfPorts': 4,
          'price': "$0.12",
        },
        {
          'portType': "Tesla",
          'portsAvailable': 2,
          'totalnumberOfPorts': 3,
          'price': "$0.12",
        },
      ]
   */
  await Future.delayed(
    const Duration(seconds: 3),
  );
  final mockData = jsonEncode({
    'id': stationId,
    'station_name': "Tesla station",
    'latitude': '70.0',
    'longitude': '70.0',
    'rating': '3.5',
    'station_short_address': "Hanover St. 24",
    'charge_per_100v': "\$60",
    'station_plugs_free': "8/10",
    'station_contact_number': "+1234567890",
    'ports_info': json.encode(
      [
        {
          'port_type': "Type 1",
          'ports_available': 2,
          'total_number_of_ports': 3,
          'price': "Free",
        },
        {
          'port_type': "Chademo",
          'ports_available': 4,
          'total_number_of_ports': 4,
          'price': "\$0.12",
        },
        {
          'port_type': "Tesla",
          'ports_available': 2,
          'total_number_of_ports': 3,
          'price': "\$0.12",
        },
      ],
    ),
  });
  // return StationOverviewModel.fromMap(data);
  // return StationOverviewModel.fromMap(response.data?['data']);
  return StationOverviewModel.fromJson(mockData);
}
