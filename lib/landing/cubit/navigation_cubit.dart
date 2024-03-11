import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zogx_ev_app_2/content_mapper.dart';

class NavigationCubit extends Cubit<String> {
  NavigationCubit() : super(features[0]);

  void changePage(int pageIndex) {
    emit(features[pageIndex]);
  }
}
