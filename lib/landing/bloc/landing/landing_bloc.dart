import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<FetchDetailsEvent>(_onFetchDetailsEvent);
  }

  void _onFetchDetailsEvent(
      FetchDetailsEvent event, Emitter<LandingState> emit) async {}
}
