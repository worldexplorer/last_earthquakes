// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_collection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureCollectionDto _$FeatureCollectionDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FeatureCollectionDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'metadata', 'bbox', 'features'],
        );
        final val = FeatureCollectionDto(
          type: $checkedConvert('type', (v) => v as String),
          metadata: $checkedConvert('metadata',
              (v) => MetadataDto.fromJson(v as Map<String, dynamic>)),
          bbox: $checkedConvert(
              'bbox',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          features: $checkedConvert(
              'features',
              (v) => (v as List<dynamic>)
                  .map((e) => FeatureDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$FeatureCollectionDtoToJson(
        FeatureCollectionDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'metadata': instance.metadata.toJson(),
      'bbox': instance.bbox,
      'features': instance.features.map((e) => e.toJson()).toList(),
    };
