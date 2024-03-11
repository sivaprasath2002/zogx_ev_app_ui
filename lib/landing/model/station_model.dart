// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StationModel {
  final int stationId;
  final double latitude;
  final double longitude;
  final String stationName;
  final String stationShortAddress;
  StationModel({
    required this.stationId,
    required this.latitude,
    required this.longitude,
    required this.stationName,
    required this.stationShortAddress,
  });

  StationModel copyWith({
    int? stationId,
    double? latitude,
    double? longitude,
    String? stationName,
    String? stationShortAddress,
  }) {
    return StationModel(
      stationId: stationId ?? this.stationId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stationName: stationName ?? this.stationName,
      stationShortAddress: stationShortAddress ?? this.stationShortAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stationId': stationId,
      'latitude': latitude,
      'longitude': longitude,
      'stationName': stationName,
      'stationShortAddress': stationShortAddress,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      stationId: map['stationId'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      stationName: map['stationName'] as String,
      stationShortAddress: map['stationShortAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StationModel.fromJson(String source) =>
      StationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StationModel(stationId: $stationId, latitude: $latitude, longitude: $longitude, stationName: $stationName, stationShortAddress: $stationShortAddress)';
  }

  @override
  bool operator ==(covariant StationModel other) {
    if (identical(this, other)) return true;

    return other.stationId == stationId &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.stationName == stationName &&
        other.stationShortAddress == stationShortAddress;
  }

  @override
  int get hashCode {
    return stationId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        stationName.hashCode ^
        stationShortAddress.hashCode;
  }
}
