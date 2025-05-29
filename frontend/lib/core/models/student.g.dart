// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  id: json['_id'] as String,
  classId: json['classId'] as String,
  schoolId: json['schoolId'] as String,
  name: json['name'] as String,
  image: json['image'] as String?,
  rollNo: (json['rollNo'] as num).toInt(),
  activities: (json['activities'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      $enumDecode(_$AreaEnumMap, k),
      Map<String, bool>.from(e as Map),
    ),
  ),
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'classId': instance.classId,
  'schoolId': instance.schoolId,
  'name': instance.name,
  'image': instance.image,
  'rollNo': instance.rollNo,
  'activities': instance.activities?.map(
    (k, e) => MapEntry(_$AreaEnumMap[k]!, e),
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
