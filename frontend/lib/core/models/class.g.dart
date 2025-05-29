// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClassArea _$ClassAreaFromJson(Map<String, dynamic> json) => _ClassArea(
  area: $enumDecode(_$AreaEnumMap, json['area']),
  medium: json['medium'] as String,
);

Map<String, dynamic> _$ClassAreaToJson(_ClassArea instance) =>
    <String, dynamic>{
      'area': _$AreaEnumMap[instance.area]!,
      'medium': instance.medium,
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

_Class _$ClassFromJson(Map<String, dynamic> json) => _Class(
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String,
  teacherId: json['teacherId'] as String?,
  grade: $enumDecode(_$GradeEnumMap, json['grade']),
  section: json['section'] as String?,
  year: json['year'] as String,
  areas:
      (json['areas'] as List<dynamic>)
          .map((e) => ClassArea.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ClassToJson(_Class instance) => <String, dynamic>{
  'schoolId': instance.schoolId,
  'teacherId': instance.teacherId,
  'grade': _$GradeEnumMap[instance.grade]!,
  'section': instance.section,
  'year': instance.year,
  'areas': instance.areas.map((e) => e.toJson()).toList(),
};

const _$GradeEnumMap = {
  Grade.nursery: 'nursery',
  Grade.lkg: 'lkg',
  Grade.ukg: 'ukg',
  Grade.grade1: 'grade1',
  Grade.grade2: 'grade2',
  Grade.grade3: 'grade3',
  Grade.grade4: 'grade4',
  Grade.grade5: 'grade5',
};
