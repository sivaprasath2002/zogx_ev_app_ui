import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/common/widgets/common_bottom_nav_bar.dart';
import 'package:zogx_ev_app_2/common/widgets/no_content.dart';
import 'package:zogx_ev_app_2/content_mapper.dart';
import 'package:zogx_ev_app_2/landing/cubit/navigation_cubit.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, String>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(state),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune),
            ),
          ],
        ),
        body: contentMapper[state] ?? const NoContent(),
        bottomNavigationBar: CommonBottomNavBar(
          currentFeature: state,
          onTap: BlocProvider.of<NavigationCubit>(context).changePage,
        ),
      ),
    );
  }
}
