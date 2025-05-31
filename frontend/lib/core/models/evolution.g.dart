// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Evolution _$EvolutionFromJson(Map<String, dynamic> json) => _Evolution(
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String,
  classId: json['classId'] as String,
  assessmentId: json['assessmentId'] as String,
  studentId: json['studentId'] as String,
  data: json['data'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$EvolutionToJson(_Evolution instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'classId': instance.classId,
      'assessmentId': instance.assessmentId,
      'studentId': instance.studentId,
      'data': instance.data,
    };
