import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/common/routes/assets/permission_assets_route.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/permission/constants/strings.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPermissionCheck();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  initPermissionCheck() {
    Geolocator.checkPermission().then((locationPermission) {
      if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        Navigator.of(context).pushReplacementNamed(landingScreenRoute);
        // Navigator.of(context).pushReplacementNamed(geofencingMapScreenRoute);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Geolocator.checkPermission().then((locationPermission) {
      print(locationPermission);
      if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        Navigator.of(context).pushReplacementNamed(landingScreenRoute);
        // Navigator.of(context).pushReplacementNamed(geofencingMapScreenRoute);
      }
    });
    super.didChangeAppLifecycleState(state);
  }

  String buttonText = locationPermissionButtonText;
  void onAllowButtonPress() async {
    // final location = Location();
    final locationPermission = await Geolocator.checkPermission();
    print(locationPermission);
    if (locationPermission == LocationPermission.denied) {
      final newPermission = await Geolocator.requestPermission();
      if (newPermission == LocationPermission.deniedForever ||
          newPermission == LocationPermission.unableToDetermine) {
        setState(() {
          buttonText = locationPermissionDeniedButtonText;
        });
        onPermissionDeniedForever();
      } else if (newPermission == LocationPermission.denied) {
        // await Geolocator.requestPermission();
        // setState(() {
        //   buttonText = locationPermissionDeniedButtonText;
        // });
      } else {
        onPermissionGranted();
      }
    } else if (locationPermission == LocationPermission.deniedForever ||
        locationPermission == LocationPermission.unableToDetermine) {
      onPermissionDeniedForever();
    } else {
      onPermissionGranted();
    }
    // if (locationPermission == LocationPermission.deniedForever ||
    //     locationPermission == LocationPermission.unableToDetermine) {
    //   onPermissionDenied();
    // } else if (locationPermission == LocationPermission.always ||
    //     locationPermission == LocationPermission.whileInUse) {
    //   onPermissionGranted();
    // } else if (locationPermission == LocationPermission.denied) {
    //   final newStatus = await Geolocator.requestPermission();
    //   // print(newStatus);
    //   if (newStatus != LocationPermission.denied &&
    //       newStatus != LocationPermission.deniedForever) {
    //     onPermissionGranted();
    //   } else {
    //     onPermissionDenied();
    //   }
    // }
  }

  void onPermissionGranted() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(landingScreenRoute, (route) => false);
  }

  void onPermissionDeniedForever() async {
    // await Fluttertoast.showToast(
    //   msg: snackBarText,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.SNACKBAR,
    //   timeInSecForIosWeb: 5,
    //   // backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          snackBarText,
        ),
      ),
    );
    await Geolocator.openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(kDefaultAllSidePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(locationPermissionGifRoute),
            Text(
              locationPermissionHeading,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kDefaultColumnWidgetSpacing,
            ),
            Text(
              locationPermissionDescription,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            FilledButton(
              onPressed: onAllowButtonPress,
              child: Text(buttonText),
            ),
          ],
        ),
      )),
    );
  }
}
