import 'dart:convert';

// import 'package:dio/dio.dart';

Future<List<dynamic>> garageVehicleProvider({required int userId}) async {
  // final dio = Dio();
  await Future.delayed(const Duration(seconds: 2));
  /**
   'vehicleId': vehicleId,
      'imageUrl': imageUrl,
      'vehicleName': vehicleName,
      'vehicleModelName': vehicleModelName,
      'batteryPercent': batteryPercent,
   */
  final mockData = json.encode([
    {
      'vehicleId': 1,
      'imageUrl':
          "https://c4.wallpaperflare.com/wallpaper/252/479/600/bmw-i8-car-bmw-wallpaper-preview.jpg",
      'vehicleName': "BMW i8",
      'vehicleModelName': "Coupe",
      'batteryPercent': "77",
    },
    {
      'vehicleId': 2,
      'imageUrl':
          "https://c4.wallpaperflare.com/wallpaper/721/2/433/nissan-gt-r-fire-r35-wallpaper-preview.jpg",
      'vehicleName': "Nissan",
      'vehicleModelName': "GT",
      'batteryPercent': "50",
    },
  ]);
  return json.decode(mockData) as List<dynamic>;
}
