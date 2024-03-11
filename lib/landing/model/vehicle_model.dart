// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

/*

*/
class VehicleModel {
  final String uuid;
  final String name;
  final String model;
  final String image;
  final String batteryPercent;
  VehicleModel({
    required this.name,
    required this.model,
    required this.image,
    required this.batteryPercent,
  }) : uuid = const Uuid().v4();

  VehicleModel copyWith({
    String? name,
    String? model,
    String? image,
    String? batteryPercent,
  }) {
    return VehicleModel(
      // uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      model: model ?? this.model,
      image: image ?? this.image,
      batteryPercent: batteryPercent ?? this.batteryPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'uuid': uuid,
      'name': name,
      'model': model,
      'image': image,
      'batteryPercent': batteryPercent,
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      // uuid: map['uuid'] as String,
      name: map['name'] as String,
      model: map['model'] as String,
      image: map['image'] as String,
      batteryPercent: map['batteryPercent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleModel.fromJson(String source) =>
      VehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VehicleModel(uuid: $uuid, name: $name, model: $model, image: $image, batteryPercent: $batteryPercent)';
  }

  @override
  bool operator ==(covariant VehicleModel other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.name == name &&
        other.model == model &&
        other.image == image &&
        other.batteryPercent == batteryPercent;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        model.hashCode ^
        image.hashCode ^
        batteryPercent.hashCode;
  }
}
