// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CurrentVehicleModel {
  final int vehicleId;
  final String imageUrl;
  final String vehicleName;
  final String vehicleModelName;
  final String batteryPercent;
  CurrentVehicleModel({
    required this.vehicleId,
    required this.imageUrl,
    required this.vehicleName,
    required this.vehicleModelName,
    required this.batteryPercent,
  });

  CurrentVehicleModel copyWith({
    int? vehicleId,
    String? imageUrl,
    String? vehicleName,
    String? vehicleModelName,
    String? batteryPercent,
  }) {
    return CurrentVehicleModel(
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

  factory CurrentVehicleModel.fromMap(Map<String, dynamic> map) {
    return CurrentVehicleModel(
      vehicleId: map['vehicleId'] as int,
      imageUrl: map['imageUrl'] as String,
      vehicleName: map['vehicleName'] as String,
      vehicleModelName: map['vehicleModelName'] as String,
      batteryPercent: map['batteryPercent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentVehicleModel.fromJson(String source) =>
      CurrentVehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentVehicleModel(vehicleId: $vehicleId, imageUrl: $imageUrl, vehicleName: $vehicleName, vehicleModelName: $vehicleModelName, batteryPercent: $batteryPercent)';
  }

  @override
  bool operator ==(covariant CurrentVehicleModel other) {
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
