// DTO regenerated by https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonSerializable/explicitToJson.html
// $ flutter pub run build_runner build
// $ flutter pub run build_runner watch

import 'package:json_annotation/json_annotation.dart';

import 'geometry_dto.dart';
import 'properties_dto.dart';

part 'feature_dto.g.dart';

@JsonSerializable(
    checked: true,
    createFactory: true,
    createToJson: true,
    explicitToJson: true,
    disallowUnrecognizedKeys: true,
    includeIfNull: true)
class FeatureDto {
  final String id;
  final String type;
  final PropertiesDto properties;
  final GeometryDto geometry;

  // https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php

  const FeatureDto({
    required this.id,
    required this.type,
    required this.properties,
    required this.geometry,
  });

  factory FeatureDto.fromJson(Map<String, dynamic> json) =>
      _$FeatureDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureDtoToJson(this);
}
