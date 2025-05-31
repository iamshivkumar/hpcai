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
  AssessmentElementType.image: 'image',
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
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String,
  classId: json['classId'] as String,
  type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
  name: json['name'] as String,
  activityId: json['activityId'] as String?,
  activity:
      json['activity'] == null
          ? null
          : Activity.fromJson(json['activity'] as Map<String, dynamic>),
  groupId: json['groupId'] as String?,
  studentId: json['studentId'] as String?,
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
      'name': instance.name,
      'activityId': instance.activityId,
      'groupId': instance.groupId,
      'studentId': instance.studentId,
      'area': _$AreaEnumMap[instance.area],
      'medium': instance.medium,
      'term': instance.term,
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

_LikeartItem _$LikeartItemFromJson(Map<String, dynamic> json) => _LikeartItem(
  index: (json['index'] as num).toInt(),
  key: json['key'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$LikeartItemToJson(_LikeartItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'key': instance.key,
      'value': instance.value,
    };

_QuizItem _$QuizItemFromJson(Map<String, dynamic> json) => _QuizItem(
  index: (json['index'] as num).toInt(),
  key: json['key'] as String,
  question: json['question'] as String?,
  type: $enumDecode(
    _$QuizItemTypeEnumMap,
    json['type'],
    unknownValue: QuizItemType.none,
  ),
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => QuizItemOption.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$QuizItemToJson(_QuizItem instance) => <String, dynamic>{
  'index': instance.index,
  'key': instance.key,
  'question': instance.question,
  'type': _$QuizItemTypeEnumMap[instance.type]!,
  'options': instance.options?.map((e) => e.toJson()).toList(),
};

const _$QuizItemTypeEnumMap = {
  QuizItemType.longAnswer: 'long-answer',
  QuizItemType.shortAnswer: 'short-answer',
  QuizItemType.trueFalse: 'true-false',
  QuizItemType.multipleShortAnswers: 'multiple-short-answers',
  QuizItemType.choice: 'choice',
  QuizItemType.multipleChoice: 'multiple-choice',
  QuizItemType.none: 'none',
};

_QuizItemOption _$QuizItemOptionFromJson(Map<String, dynamic> json) =>
    _QuizItemOption(
      index: (json['index'] as num).toInt(),
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$QuizItemOptionToJson(_QuizItemOption instance) =>
    <String, dynamic>{
      'index': instance.index,
      'key': instance.key,
      'value': instance.value,
    };
