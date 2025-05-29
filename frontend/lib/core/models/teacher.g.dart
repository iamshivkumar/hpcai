// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Teacher _$TeacherFromJson(Map<String, dynamic> json) => _Teacher(
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String,
  name: json['name'] as String,
  image: json['image'] as String?,
);

Map<String, dynamic> _$TeacherToJson(_Teacher instance) => <String, dynamic>{
  'schoolId': instance.schoolId,
  'name': instance.name,
  'image': instance.image,
};
