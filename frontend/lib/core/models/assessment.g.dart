// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssessmentElement _$AssessmentElementFromJson(Map<String, dynamic> json) =>
    _AssessmentElement(
      index: (json['index'] as num).toInt(),
      instruction: json['instruction'] as String?,
      type: $enumDecode(_$AssessmentElementTypeEnumMap, json['type']),
      value: json['value'],
    );

Map<String, dynamic> _$AssessmentElementToJson(_AssessmentElement instance) =>
    <String, dynamic>{
      'index': instance.index,
      'instruction': instance.instruction,
      'type': _$AssessmentElementTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$AssessmentElementTypeEnumMap = {
  AssessmentElementType.likeart: 'likeart',
  AssessmentElementType.quiz: 'quiz',
  AssessmentElementType.grid: 'grid',
};

_AssessmentSection _$AssessmentSectionFromJson(Map<String, dynamic> json) =>
    _AssessmentSection(
      key: json['key'] as String,
      index: (json['index'] as num).toInt(),
      name: json['name'] as String?,
      elements:
          (json['elements'] as List<dynamic>?)
              ?.map(
                (e) => AssessmentElement.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AssessmentSectionToJson(_AssessmentSection instance) =>
    <String, dynamic>{
      'key': instance.key,
      'index': instance.index,
      'name': instance.name,
      'elements': instance.elements.map((e) => e.toJson()).toList(),
    };

_Assessment _$AssessmentFromJson(Map<String, dynamic> json) => _Assessment(
  schoolId: json['schoolId'] as String,
  classId: json['classId'] as String,
  type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
  area: $enumDecodeNullable(_$AreaEnumMap, json['area']),
  medium: json['medium'] as String?,
  term: json['term'] as String?,
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => AssessmentSection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AssessmentToJson(_Assessment instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'classId': instance.classId,
      'type': _$AssessmentTypeEnumMap[instance.type]!,
      'area': _$AreaEnumMap[instance.area],
      'medium': instance.medium,
      'term': instance.term,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
    };

const _$AssessmentTypeEnumMap = {
  AssessmentType.activity: 'activity',
  AssessmentType.peer: 'peer',
  AssessmentType.parent: 'parent',
  AssessmentType.about: 'about',
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
