import 'dart:convert';

import 'package:dio/dio.dart';

Future<dynamic> vehicleOverviewProvider({required int vehicleId}) async {
  final dio = Dio();
  final mockData = json.encode({
    'vehicleId': vehicleId,
    'vehicleName': "BMW i8",
    'vehicleModelName': "Coupe",
    'imageUrl':
        "https://c4.wallpaperflare.com/wallpaper/252/479/600/bmw-i8-car-bmw-wallpaper-preview.jpg",
    'vehicleRegisteredAddress': "USA, New York",
    'vehicleRange': "470",
    'vehicleBatteryCapacity': "95",
    'vehicleNextService': "11,305",
    'vehicleNextBatteryChange': "41,103",
    'vehicleCurrentBattery': "77",
  });
  await Future.delayed(const Duration(seconds: 2));
  return json.decode(mockData);
}
