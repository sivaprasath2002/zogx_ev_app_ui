import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/authentication/presentation/screens/auth_code_page.dart';
import 'package:zogx_ev_app_2/authentication/presentation/screens/auth_otp_screen.dart';
import 'package:zogx_ev_app_2/authentication/presentation/screens/auth_phone_number_screen.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/garage/presentation/screens/garage_vehicle_info_screen.dart';
import 'package:zogx_ev_app_2/landing/presentation/screens/landing_screen.dart';
import 'package:zogx_ev_app_2/landing/presentation/screens/station_info_screen.dart';
import 'package:zogx_ev_app_2/permission/presentation/screens/location_permission_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  final pageName = routeSettings.name;
  final args = routeSettings.arguments;
  switch (pageName) {
    case landingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      );
    case codeAuthScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const AuthCodePage(),
      );
    case otpAuthScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const AuthOtpScreen(),
      );
    case phoneAuthScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const AuthPhoneNumberScreen(),
      );
    case loactionPermissionScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const LocationPermissionScreen(),
      );
    case stationInfoScreenRoute:
      {
        final stationId = args as int;
        return MaterialPageRoute(
          builder: (context) => StationInfoScreen(stationId: stationId),
        );
      }
    case carInfoScreenRoute:
      {
        final vehicleId = args as int;
        return MaterialPageRoute(
          builder: (context) => GarageVehicleInfoScreen(vehicleId: vehicleId),
        );
      }
  }
  return null;
}
