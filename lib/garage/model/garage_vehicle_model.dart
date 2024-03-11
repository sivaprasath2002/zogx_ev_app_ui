// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GarageVehicleModel {
  final int vehicleId;
  final String imageUrl;
  final String vehicleName;
  final String vehicleModelName;
  final String batteryPercent;
  GarageVehicleModel({
    required this.vehicleId,
    required this.imageUrl,
    required this.vehicleName,
    required this.vehicleModelName,
    required this.batteryPercent,
  });

  GarageVehicleModel copyWith({
    int? vehicleId,
    String? imageUrl,
    String? vehicleName,
    String? vehicleModelName,
    String? batteryPercent,
  }) {
    return GarageVehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      imageUrl: imageUrl ?? this.imageUrl,
      vehicleName: vehicleName ?? this.vehicleName,
      vehicleModelName: vehicleModelName ?? this.vehicleModelName,
      batteryPercent: batteryPercent ?? this.batteryPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vehicleId': vehicleId,
      'imageUrl': imageUrl,
      'vehicleName': vehicleName,
      'vehicleModelName': vehicleModelName,
      'batteryPercent': batteryPercent,
    };
  }

  factory GarageVehicleModel.fromMap(Map<String, dynamic> map) {
    return GarageVehicleModel(
      vehicleId: map['vehicleId'] as int,
      imageUrl: map['imageUrl'] as String,
      vehicleName: map['vehicleName'] as String,
      vehicleModelName: map['vehicleModelName'] as String,
      batteryPercent: map['batteryPercent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GarageVehicleModel.fromJson(String source) =>
      GarageVehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GarageVehicleModel(vehicleId: $vehicleId, imageUrl: $imageUrl, vehicleName: $vehicleName, vehicleModelName: $vehicleModelName, batteryPercent: $batteryPercent)';
  }

  @override
  bool operator ==(covariant GarageVehicleModel other) {
    if (identical(this, other)) return true;

    return other.vehicleId == vehicleId &&
        other.imageUrl == imageUrl &&
        other.vehicleName == vehicleName &&
        other.vehicleModelName == vehicleModelName &&
        other.batteryPercent == batteryPercent;
  }

  @override
  int get hashCode {
    return vehicleId.hashCode ^
        imageUrl.hashCode ^
        vehicleName.hashCode ^
        vehicleModelName.hashCode ^
        batteryPercent.hashCode;
  }
}
