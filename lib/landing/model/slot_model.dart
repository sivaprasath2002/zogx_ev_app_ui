// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SlotModel {
  final String slotsOfDay;
  final List<String> slots;
  SlotModel({
    required this.slotsOfDay,
    required this.slots,
  });

  SlotModel copyWith({
    String? slotsOfDay,
    List<String>? slots,
  }) {
    return SlotModel(
      slotsOfDay: slotsOfDay ?? this.slotsOfDay,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slotsOfDay': slotsOfDay,
      'slots': slots,
    };
  }

  factory SlotModel.fromMap(Map<String, dynamic> map) {
    return SlotModel(
        slotsOfDay: map['slotsOfDay'] as String,
        slots: List<String>.from(
          (map['slots'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory SlotModel.fromJson(String source) =>
      SlotModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SlotModel(slotsOfDay: $slotsOfDay, slots: $slots)';

  @override
  bool operator ==(covariant SlotModel other) {
    if (identical(this, other)) return true;

    return other.slotsOfDay == slotsOfDay && listEquals(other.slots, slots);
  }

  @override
  int get hashCode => slotsOfDay.hashCode ^ slots.hashCode;
}
