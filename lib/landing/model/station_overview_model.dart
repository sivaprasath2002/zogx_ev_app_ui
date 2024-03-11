// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StationOverviewModel {
  final int stationId;
  final double latitude;
  final double longitude;
  final String stationName;
  final double rating;
  final String stationShortAddress;
  final String chargePer100V;
  final String stationPlugsFree;
  final String stationContactNumber;
  final List<StationPort> portsInfo;
  StationOverviewModel({
    required this.stationId,
    required this.latitude,
    required this.longitude,
    required this.stationName,
    required this.rating,
    required this.stationShortAddress,
    required this.chargePer100V,
    required this.stationPlugsFree,
    required this.stationContactNumber,
    required this.portsInfo,
  });

  StationOverviewModel copyWith({
    int? stationId,
    double? latitude,
    double? longitude,
    String? stationName,
    double? rating,
    String? stationShortAddress,
    String? chargePer100V,
    String? stationPlugsFree,
    String? stationContactNumber,
    List<StationPort>? portsInfo,
  }) {
    return StationOverviewModel(
      stationId: stationId ?? this.stationId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stationName: stationName ?? this.stationName,
      rating: rating ?? this.rating,
      stationShortAddress: stationShortAddress ?? this.stationShortAddress,
      chargePer100V: chargePer100V ?? this.chargePer100V,
      stationPlugsFree: stationPlugsFree ?? this.stationPlugsFree,
      stationContactNumber: stationContactNumber ?? this.stationContactNumber,
      portsInfo: portsInfo ?? this.portsInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': stationId,
      'latitude': latitude,
      'longitude': longitude,
      'station_name': stationName,
      'rating': rating,
      'station_short_address': stationShortAddress,
      'charge_per_100v': chargePer100V,
      'station_plugs_free': stationPlugsFree,
      'station_contact_number': stationContactNumber,
      'ports_info': portsInfo.map((x) => x.toMap()).toList(),
    };
  }

  factory StationOverviewModel.fromMap(Map<String, dynamic> map) {
    return StationOverviewModel(
      stationId: map['id'] as int,
      latitude: double.tryParse(map['latitude']) ?? 0.0,
      longitude: double.tryParse(map['longitude']) ?? 0.0,
      stationName: map['station_name'] as String,
      rating: double.tryParse(map['rating']) ?? 0.0,
      stationShortAddress: map['station_short_address'] as String,
      chargePer100V: map['charge_per_100v'] as String,
      stationPlugsFree: map['station_plugs_free'] as String,
      stationContactNumber: map['station_contact_number'] as String,
      portsInfo: List<StationPort>.from(
        (json.decode(map['ports_info']) as List<dynamic>).map<StationPort>(
          (x) => StationPort.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StationOverviewModel.fromJson(String source) =>
      StationOverviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StationOverviewModel(stationId: $stationId, latitude: $latitude, longitude: $longitude, stationName: $stationName, rating: $rating, stationShortAddress: $stationShortAddress, chargePer100V: $chargePer100V, stationPlugsFree: $stationPlugsFree, stationContactNumber: $stationContactNumber, portsInfo: $portsInfo)';
  }

  @override
  bool operator ==(covariant StationOverviewModel other) {
    if (identical(this, other)) return true;

    return other.stationId == stationId &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.stationName == stationName &&
        other.rating == rating &&
        other.stationShortAddress == stationShortAddress &&
        other.chargePer100V == chargePer100V &&
        other.stationPlugsFree == stationPlugsFree &&
        other.stationContactNumber == stationContactNumber &&
        listEquals(other.portsInfo, portsInfo);
  }

  @override
  int get hashCode {
    return stationId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        stationName.hashCode ^
        rating.hashCode ^
        stationShortAddress.hashCode ^
        chargePer100V.hashCode ^
        stationPlugsFree.hashCode ^
        stationContactNumber.hashCode ^
        portsInfo.hashCode;
  }
}

class StationPort {
  final String portType;
  final int portsAvailable;
  final int totalnumberOfPorts;
  final String price;
  StationPort({
    required this.portType,
    required this.portsAvailable,
    required this.totalnumberOfPorts,
    required this.price,
  });

  StationPort copyWith({
    String? portType,
    int? portsAvailable,
    int? totalnumberOfPorts,
    String? price,
  }) {
    return StationPort(
      portType: portType ?? this.portType,
      portsAvailable: portsAvailable ?? this.portsAvailable,
      totalnumberOfPorts: totalnumberOfPorts ?? this.totalnumberOfPorts,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'port_type': portType,
      'ports_available': portsAvailable,
      'total_number_of_ports': totalnumberOfPorts,
      'price': price,
    };
  }

  factory StationPort.fromMap(Map<String, dynamic> map) {
    return StationPort(
      portType: map['port_type'] as String,
      portsAvailable: map['ports_available'] as int,
      totalnumberOfPorts: map['total_number_of_ports'] as int,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StationPort.fromJson(String source) =>
      StationPort.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StationPort(portType: $portType, portsAvailable: $portsAvailable, totalnumberOfPorts: $totalnumberOfPorts, price: $price)';
  }

  @override
  bool operator ==(covariant StationPort other) {
    if (identical(this, other)) return true;

    return other.portType == portType &&
        other.portsAvailable == portsAvailable &&
        other.totalnumberOfPorts == totalnumberOfPorts &&
        other.price == price;
  }

  @override
  int get hashCode {
    return portType.hashCode ^
        portsAvailable.hashCode ^
        totalnumberOfPorts.hashCode ^
        price.hashCode;
  }
}
