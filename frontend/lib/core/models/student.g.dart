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
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'classId': instance.classId,
  'schoolId': instance.schoolId,
  'name': instance.name,
  'image': instance.image,
  'rollNo': instance.rollNo,
};
