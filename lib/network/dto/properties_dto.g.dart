// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesDto _$PropertiesDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PropertiesDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'mag',
            'place',
            'time',
            'updated',
            'tz',
            'url',
            'detail',
            'felt',
            'cdi',
            'mmi',
            'alert',
            'status',
            'tsunami',
            'sig',
            'net',
            'code',
            'ids',
            'sources',
            'types',
            'nst',
            'dmin',
            'rms',
            'gap',
            'magType',
            'type',
            'title'
          ],
        );
        final val = PropertiesDto(
          mag: $checkedConvert('mag', (v) => (v as num).toDouble()),
          place: $checkedConvert('place', (v) => v as String),
          time: $checkedConvert('time', (v) => v as int),
          updated: $checkedConvert('updated', (v) => v as int),
          tz: $checkedConvert('tz', (v) => v as int?),
          url: $checkedConvert('url', (v) => v as String),
          detail: $checkedConvert('detail', (v) => v as String),
          felt: $checkedConvert('felt', (v) => v as int?),
          cdi: $checkedConvert('cdi', (v) => (v as num?)?.toDouble()),
          mmi: $checkedConvert('mmi', (v) => (v as num?)?.toDouble()),
          alert: $checkedConvert('alert', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String),
          tsunami: $checkedConvert('tsunami', (v) => v as int),
          sig: $checkedConvert('sig', (v) => v as int),
          net: $checkedConvert('net', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          ids: $checkedConvert('ids', (v) => v as String),
          sources: $checkedConvert('sources', (v) => v as String),
          types: $checkedConvert('types', (v) => v as String),
          nst: $checkedConvert('nst', (v) => v as int?),
          dmin: $checkedConvert('dmin', (v) => (v as num?)?.toDouble()),
          rms: $checkedConvert('rms', (v) => (v as num).toDouble()),
          gap: $checkedConvert('gap', (v) => (v as num?)?.toDouble()),
          magType: $checkedConvert('magType', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PropertiesDtoToJson(PropertiesDto instance) =>
    <String, dynamic>{
      'mag': instance.mag,
      'place': instance.place,
      'time': instance.time,
      'updated': instance.updated,
      'tz': instance.tz,
      'url': instance.url,
      'detail': instance.detail,
      'felt': instance.felt,
      'cdi': instance.cdi,
      'mmi': instance.mmi,
      'alert': instance.alert,
      'status': instance.status,
      'tsunami': instance.tsunami,
      'sig': instance.sig,
      'net': instance.net,
      'code': instance.code,
      'ids': instance.ids,
      'sources': instance.sources,
      'types': instance.types,
      'nst': instance.nst,
      'dmin': instance.dmin,
      'rms': instance.rms,
      'gap': instance.gap,
      'magType': instance.magType,
      'type': instance.type,
      'title': instance.title,
    };
