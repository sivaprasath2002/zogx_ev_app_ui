import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/account/presentation/screens/charging_activity.dart';
import 'package:zogx_ev_app_2/account/presentation/screens/notification_screen.dart';
import 'package:zogx_ev_app_2/account/presentation/screens/payment_screen.dart';
import 'package:zogx_ev_app_2/account/presentation/screens/profile_screen.dart';

const accountTabbarTab = [
  "Profile",
  "Activity",
  "Notifications",
  "Payment",
];

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          tabs: accountTabbarTab.map((heading) => Text(heading)).toList(),
        ),
        body: const TabBarView(
          children: [
            ProfileScreen(),
            ChargingActivity(),
            NotificationScree(),
            PaymentScreen(),
          ],
        ),
      ),
    );
  }
}
