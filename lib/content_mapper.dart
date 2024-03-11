import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/account/presentation/screens/account_screen.dart';
import 'package:zogx_ev_app_2/garage/presentation/screens/vehicles_list_screen.dart';
import 'package:zogx_ev_app_2/landing/presentation/widgets/landing_content.dart';
import 'package:zogx_ev_app_2/map_service/presentation/screens/map_service_screen.dart';

const String home = "Home";
const String map = "Map";
const String garage = "Garage";
const String profile = "Profile";

List<String> features = [
  home,
  map,
  garage,
  profile,
];

Map<String, Widget> featureIconMapper = {
  home: const Icon(Icons.home),
  map: const Icon(Icons.map),
  garage: const Icon(Icons.directions_car),
  profile: const Icon(Icons.person),
};

Map<String, Widget> contentMapper = {
  home: const LandingContent(),
  map: const MapServiceScreen(),
  garage: const VehicleListScreen(),
  profile: const AccountScreen(),
};
