import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/content_mapper.dart';

class CommonBottomNavBar extends StatelessWidget {
  final String currentFeature;
  final void Function(int) onTap;
  const CommonBottomNavBar(
      {super.key, required this.currentFeature, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColorDark,
      currentIndex: features.indexOf(currentFeature),
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: featureIconMapper.entries
          .map(
            (feature) => BottomNavigationBarItem(
              icon: feature.value,
              label: feature.key,
            ),
          )
          .toList(),
    );
  }
}
