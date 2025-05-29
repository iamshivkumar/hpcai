// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Group _$GroupFromJson(Map<String, dynamic> json) => _Group(
  id: json['_id'] as String,
  classId: json['classId'] as String,
  schoolId: json['schoolId'] as String,
  name: json['name'] as String,
  area: $enumDecodeNullable(_$AreaEnumMap, json['area']),
  studentIds:
      (json['studentIds'] as List<dynamic>).map((e) => e as String).toList(),
  primary: json['primary'] as bool? ?? false,
);

Map<String, dynamic> _$GroupToJson(_Group instance) => <String, dynamic>{
  'classId': instance.classId,
  'schoolId': instance.schoolId,
  'name': instance.name,
  'area': _$AreaEnumMap[instance.area],
  'studentIds': instance.studentIds,
  'primary': instance.primary,
};

const _$AreaEnumMap = {
  Area.physical: 'physical',
  Area.socioEmotional: 'socioEmotional',
  Area.cognitive: 'cognitive',
  Area.language: 'language',
  Area.aesthetic: 'aesthetic',
  Area.positive: 'positive',
  Area.languageR1: 'languageR1',
  Area.languageR2: 'languageR2',
  Area.maths: 'maths',
  Area.worldAround: 'worldAround',
  Area.artEd: 'artEd',
  Area.physicalEd: 'physicalEd',
};
