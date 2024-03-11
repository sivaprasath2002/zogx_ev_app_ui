import 'package:zogx_ev_app_2/landing/data_provider/slots_provider.dart';
import 'package:zogx_ev_app_2/landing/model/slot_model.dart';

Future<SlotModel> slotsAvailableRepo(
    {required DateTime dateTime, required int stationId}) async {
  final data =
      await getSlotsAvailable(dateTime: dateTime, stationId: stationId);
  return SlotModel.fromJson(data);
}
