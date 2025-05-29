// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attendance _$AttendanceFromJson(Map<String, dynamic> json) => _Attendance(
  id: json['_id'] as String,
  schoolId: json['schoolId'] as String,
  classId: json['classId'] as String,
  studentId: json['studentId'] as String,
  date: json['date'] as String,
  datetime: DateTime.parse(json['datetime'] as String),
  status: $enumDecode(_$AttendanceStatusEnumMap, json['status']),
);

Map<String, dynamic> _$AttendanceToJson(_Attendance instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'classId': instance.classId,
      'studentId': instance.studentId,
      'date': instance.date,
      'datetime': instance.datetime.toIso8601String(),
      'status': _$AttendanceStatusEnumMap[instance.status]!,
    };

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.present: 'P',
  AttendanceStatus.absent: 'A',
  AttendanceStatus.late: 'L',
  AttendanceStatus.holiday: 'H',
  AttendanceStatus.medical: 'M',
};
