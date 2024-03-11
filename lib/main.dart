import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/common/routes/screen/route_generator.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/garage/bloc/vehicle_info/vehicle_info_bloc.dart';
import 'package:zogx_ev_app_2/garage/bloc/garage_vehicle/garage_vehicle_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/bluetooth/bluetooth_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/current_car/current_car_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/landing/landing_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/nearby_stations/nearby_stations_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/slots/bloc/slots_bloc.dart';
import 'package:zogx_ev_app_2/landing/bloc/station_info/bloc/station_info_bloc.dart';
import 'package:zogx_ev_app_2/landing/cubit/current_vehicle_cubit.dart';
import 'package:zogx_ev_app_2/landing/cubit/fav_station_cubit_cubit.dart';
import 'package:zogx_ev_app_2/landing/cubit/navigation_cubit.dart';

Future<bool> isValidToken(String token) async {
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  final token = await const FlutterSecureStorage().read(key: 'token');
  String initialRoute = phoneAuthScreenRoute;
  if (token != null) {
    final isValid = await isValidToken(token);
    if (isValid) {
      // initialRoute = codeAuthScreenRoute;
    }
  }
  runApp(
    EvApp(
      initialRoute: initialRoute,
    ),
  );
}

class EvApp extends StatelessWidget {
  final String initialRoute;
  const EvApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => LandingBloc(),
        ),
        BlocProvider(
          create: (context) => BluetoothBloc(),
        ),
        BlocProvider(
          create: (context) => NearbyStationsBloc(),
        ),
        BlocProvider(
          create: (context) => StationInfoBloc(),
        ),
        BlocProvider(
          create: (context) => FavStationCubit(),
        ),
        BlocProvider(
          create: (context) => SlotsBloc(),
        ),
        BlocProvider(
          create: (context) => GarageVehicleBloc(),
        ),
        BlocProvider(
          create: (context) => CurrentCarBloc(),
        ),
        BlocProvider(
          create: (context) => VehicleInfoBloc(),
        ),
        BlocProvider(
          create: (context) => CurrentVehicleCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Ev app 2',
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
          primaryColorDark: const Color.fromARGB(255, 41, 41, 41),
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
              ),
          bottomNavigationBarTheme:
              Theme.of(context).bottomNavigationBarTheme.copyWith(
                    selectedItemColor: Colors.green,
                  ),
          tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
                labelColor: Colors.green,
                indicatorColor: Colors.green,
                labelPadding: const EdgeInsets.all(4),
                dividerHeight: 0.0,
              ),
          dataTableTheme: Theme.of(context).dataTableTheme.copyWith(
                headingTextStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom().copyWith(
              fixedSize: MaterialStatePropertyAll(
                Size.fromWidth(
                  MediaQuery.of(context).size.width,
                ),
              ),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kDefaultFilledButtonRadius,
                    ),
                  ),
                ),
              ),
            ),
          ),
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                fillColor: const Color.fromARGB(255, 41, 41, 41),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kDefaultInputFieldRadius,
                    ),
                  ),
                ),
              ),
        ),
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
