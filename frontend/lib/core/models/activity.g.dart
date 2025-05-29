// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Activity _$ActivityFromJson(Map<String, dynamic> json) => _Activity(
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String?,
  grade: const GradeConverter().fromJson(json['grade'] as String),
  area: $enumDecode(_$AreaEnumMap, json['area']),
  medium: json['medium'] as String?,
  title: json['title'] as String,
  description: json['description'] as String,
  questions:
      (json['questions'] as List<dynamic>?)?.map((e) => e as String).toList(),
  pedagogies:
      (json['pedagogies'] as List<dynamic>?)?.map((e) => e as String).toList(),
  goals:
      (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  competencies:
      (json['competencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  rubric:
      (json['rubric'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          $enumDecode(_$RubricAbilityEnumMap, k),
          (e as Map<String, dynamic>).map(
            (k, e) =>
                MapEntry($enumDecode(_$RubricLevelEnumMap, k), e as String),
          ),
        ),
      ) ??
      const {},
);

Map<String, dynamic> _$ActivityToJson(_Activity instance) => <String, dynamic>{
  'schoolId': instance.schoolId,
  'grade': const GradeConverter().toJson(instance.grade),
  'area': _$AreaEnumMap[instance.area]!,
  'medium': instance.medium,
  'title': instance.title,
  'description': instance.description,
  'questions': instance.questions,
  'pedagogies': instance.pedagogies,
  'goals': instance.goals,
  'competencies': instance.competencies,
  'rubric': instance.rubric.map(
    (k, e) => MapEntry(
      _$RubricAbilityEnumMap[k]!,
      e.map((k, e) => MapEntry(_$RubricLevelEnumMap[k]!, e)),
    ),
  ),
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

const _$RubricLevelEnumMap = {
  RubricLevel.beginner: 'beginner',
  RubricLevel.proficient: 'proficient',
  RubricLevel.advanced: 'advanced',
};

const _$RubricAbilityEnumMap = {
  RubricAbility.awareness: 'awareness',
  RubricAbility.sensitivity: 'sensitivity',
  RubricAbility.creativity: 'creativity',
};
