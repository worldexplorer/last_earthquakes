// DTO regenerated by https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonSerializable/explicitToJson.html
// $ flutter pub run build_runner build
// $ flutter pub run build_runner watch

import 'package:json_annotation/json_annotation.dart';

import 'feature_dto.dart';
import 'metadata_dto.dart';

part 'feature_collection_dto.g.dart';

@JsonSerializable(
    checked: true,
    createFactory: true,
    createToJson: true,
    explicitToJson: true,
    disallowUnrecognizedKeys: true,
    includeIfNull: true)
class FeatureCollectionDto {
  final String type;
  final MetadataDto metadata;
  final List<double>? bbox;
  final List<FeatureDto> features;

  // https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php

  const FeatureCollectionDto({
    required this.type,
    required this.metadata,
    this.bbox,
    required this.features,
  });

  factory FeatureCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$FeatureCollectionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureCollectionDtoToJson(this);
}
