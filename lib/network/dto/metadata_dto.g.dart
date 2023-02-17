// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MetadataDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'generated',
            'url',
            'title',
            'api',
            'count',
            'status'
          ],
        );
        final val = MetadataDto(
          generated: $checkedConvert('generated', (v) => v as int),
          url: $checkedConvert('url', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          api: $checkedConvert('api', (v) => v as String),
          count: $checkedConvert('count', (v) => v as int),
          status: $checkedConvert('status', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$MetadataDtoToJson(MetadataDto instance) =>
    <String, dynamic>{
      'generated': instance.generated,
      'url': instance.url,
      'title': instance.title,
      'api': instance.api,
      'count': instance.count,
      'status': instance.status,
    };
