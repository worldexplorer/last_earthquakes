// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateDto _$CoordinateDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CoordinateDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['lngLatDepth'],
        );
        final val = CoordinateDto(
          lngLatDepth: $checkedConvert(
              'lngLatDepth',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoordinateDtoToJson(CoordinateDto instance) =>
    <String, dynamic>{
      'lngLatDepth': instance.lngLatDepth,
    };
