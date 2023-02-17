// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureDto _$FeatureDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FeatureDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'type', 'properties', 'geometry'],
        );
        final val = FeatureDto(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          properties: $checkedConvert('properties',
              (v) => PropertiesDto.fromJson(v as Map<String, dynamic>)),
          geometry: $checkedConvert('geometry',
              (v) => GeometryDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$FeatureDtoToJson(FeatureDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'properties': instance.properties.toJson(),
      'geometry': instance.geometry.toJson(),
    };
