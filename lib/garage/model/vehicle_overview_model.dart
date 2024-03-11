// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VehicleOverviewModel {
  final int vehicleId;
  final String vehicleName;
  final String vehicleModelName;
  final String imageUrl;
  final String vehicleRegisteredAddress;
  final String vehicleRange;
  final String vehicleBatteryCapacity;
  final String vehicleNextService;
  final String vehicleNextBatteryChange;
  final String vehicleCurrentBattery;
  VehicleOverviewModel({
    required this.vehicleId,
    required this.vehicleName,
    required this.vehicleModelName,
    required this.imageUrl,
    required this.vehicleRegisteredAddress,
    required this.vehicleRange,
    required this.vehicleBatteryCapacity,
    required this.vehicleNextService,
    required this.vehicleNextBatteryChange,
    required this.vehicleCurrentBattery,
  });

  VehicleOverviewModel copyWith({
    int? vehicleId,
    String? vehicleName,
    String? vehicleModelName,
    String? imageUrl,
    String? vehicleRegisteredAddress,
    String? vehicleRange,
    String? vehicleBatteryCapacity,
    String? vehicleNextService,
    String? vehicleNextBatteryChange,
    String? vehicleCurrentBattery,
  }) {
    return VehicleOverviewModel(
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleName: vehicleName ?? this.vehicleName,
      vehicleModelName: vehicleModelName ?? this.vehicleModelName,
      imageUrl: imageUrl ?? this.imageUrl,
      vehicleRegisteredAddress:
          vehicleRegisteredAddress ?? this.vehicleRegisteredAddress,
      vehicleRange: vehicleRange ?? this.vehicleRange,
      vehicleBatteryCapacity:
          vehicleBatteryCapacity ?? this.vehicleBatteryCapacity,
      vehicleNextService: vehicleNextService ?? this.vehicleNextService,
      vehicleNextBatteryChange:
          vehicleNextBatteryChange ?? this.vehicleNextBatteryChange,
      vehicleCurrentBattery:
          vehicleCurrentBattery ?? this.vehicleCurrentBattery,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vehicleId': vehicleId,
      'vehicleName': vehicleName,
      'vehicleModelName': vehicleModelName,
      'imageUrl': imageUrl,
      'vehicleRegisteredAddress': vehicleRegisteredAddress,
      'vehicleRange': vehicleRange,
      'vehicleBatteryCapacity': vehicleBatteryCapacity,
      'vehicleNextService': vehicleNextService,
      'vehicleNextBatteryChange': vehicleNextBatteryChange,
      'vehicleCurrentBattery': vehicleCurrentBattery,
    };
  }

  factory VehicleOverviewModel.fromMap(Map<String, dynamic> map) {
    return VehicleOverviewModel(
      vehicleId: map['vehicleId'] as int,
      vehicleName: map['vehicleName'] as String,
      vehicleModelName: map['vehicleModelName'] as String,
      imageUrl: map['imageUrl'] as String,
      vehicleRegisteredAddress: map['vehicleRegisteredAddress'] as String,
      vehicleRange: map['vehicleRange'] as String,
      vehicleBatteryCapacity: map['vehicleBatteryCapacity'] as String,
      vehicleNextService: map['vehicleNextService'] as String,
      vehicleNextBatteryChange: map['vehicleNextBatteryChange'] as String,
      vehicleCurrentBattery: map['vehicleCurrentBattery'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleOverviewModel.fromJson(String source) =>
      VehicleOverviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VehicleOverviewModel(vehicleId: $vehicleId, vehicleName: $vehicleName, vehicleModelName: $vehicleModelName, imageUrl: $imageUrl, vehicleRegisteredAddress: $vehicleRegisteredAddress, vehicleRange: $vehicleRange, vehicleBatteryCapacity: $vehicleBatteryCapacity, vehicleNextService: $vehicleNextService, vehicleNextBatteryChange: $vehicleNextBatteryChange, vehicleCurrentBattery: $vehicleCurrentBattery)';
  }

  @override
  bool operator ==(covariant VehicleOverviewModel other) {
    if (identical(this, other)) return true;

    return other.vehicleId == vehicleId &&
        other.vehicleName == vehicleName &&
        other.vehicleModelName == vehicleModelName &&
        other.imageUrl == imageUrl &&
        other.vehicleRegisteredAddress == vehicleRegisteredAddress &&
        other.vehicleRange == vehicleRange &&
        other.vehicleBatteryCapacity == vehicleBatteryCapacity &&
        other.vehicleNextService == vehicleNextService &&
        other.vehicleNextBatteryChange == vehicleNextBatteryChange &&
        other.vehicleCurrentBattery == vehicleCurrentBattery;
  }

  @override
  int get hashCode {
    return vehicleId.hashCode ^
        vehicleName.hashCode ^
        vehicleModelName.hashCode ^
        imageUrl.hashCode ^
        vehicleRegisteredAddress.hashCode ^
        vehicleRange.hashCode ^
        vehicleBatteryCapacity.hashCode ^
        vehicleNextService.hashCode ^
        vehicleNextBatteryChange.hashCode ^
        vehicleCurrentBattery.hashCode;
  }
}
