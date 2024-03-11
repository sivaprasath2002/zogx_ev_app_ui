import 'package:hydrated_bloc/hydrated_bloc.dart';

class CurrentVehicleCubit extends HydratedCubit<int> {
  CurrentVehicleCubit() : super(0);

  void changeCurrentVehicle(int pickedVehicleId) {
    emit(pickedVehicleId);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['car_id'];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {
      'car_id': state,
    };
  }
}
