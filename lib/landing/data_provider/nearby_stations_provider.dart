import 'dart:convert';

Future<List<dynamic>> getNearbyStation(
    {required double latitude, required double longitude}) async {
  /**
   * TODO: just a mock api to get near by stations;
   * Model data
   * 'stationId': 5,
      'latitude': latitude,
      'longitude': longitude,
   */
  await Future.delayed(const Duration(seconds: 2));
  final data = jsonEncode(
    [
      {
        'stationId': 6,
        'latitude': latitude + 0.1,
        'longitude': longitude + 0.1,
        'stationName': "Tesla station",
        'stationShortAddress': "Hanover St. 24",
      },
      // {
      //   'stationId': 6,
      //   'latitude': latitude + 0.2,
      //   'longitude': longitude + 0.2,
      // },
      // {
      //   'stationId': 7,
      //   'latitude': latitude - 0.1,
      //   'longitude': longitude - 0.1,
      // },
    ],
  );
  return jsonDecode(data);
}
