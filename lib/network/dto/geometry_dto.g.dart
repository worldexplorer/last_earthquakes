// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeometryDto _$GeometryDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GeometryDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'coordinates'],
        );
        final val = GeometryDto(
          type: $checkedConvert('type', (v) => v as String),
          coordinates: $checkedConvert(
              'coordinates',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$GeometryDtoToJson(GeometryDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
