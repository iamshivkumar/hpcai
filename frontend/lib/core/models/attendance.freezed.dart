// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attendance {

@JsonKey(includeToJson: false, name: '_id') String get id; String get schoolId; String get classId; String get studentId; String get date;// Format: "YYYY-MM-DD"
 DateTime get datetime; AttendanceStatus get status;
/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceCopyWith<Attendance> get copyWith => _$AttendanceCopyWithImpl<Attendance>(this as Attendance, _$identity);

  /// Serializes this Attendance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attendance&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.date, date) || other.date == date)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,studentId,date,datetime,status);

@override
String toString() {
  return 'Attendance(id: $id, schoolId: $schoolId, classId: $classId, studentId: $studentId, date: $date, datetime: $datetime, status: $status)';
}


}

/// @nodoc
abstract mixin class $AttendanceCopyWith<$Res>  {
  factory $AttendanceCopyWith(Attendance value, $Res Function(Attendance) _then) = _$AttendanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, String studentId, String date, DateTime datetime, AttendanceStatus status
});




}
/// @nodoc
class _$AttendanceCopyWithImpl<$Res>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._self, this._then);

  final Attendance _self;
  final $Res Function(Attendance) _then;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? studentId = null,Object? date = null,Object? datetime = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Attendance implements Attendance {
  const _Attendance({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.schoolId, required this.classId, required this.studentId, required this.date, required this.datetime, required this.status});
  factory _Attendance.fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String schoolId;
@override final  String classId;
@override final  String studentId;
@override final  String date;
// Format: "YYYY-MM-DD"
@override final  DateTime datetime;
@override final  AttendanceStatus status;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceCopyWith<_Attendance> get copyWith => __$AttendanceCopyWithImpl<_Attendance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attendance&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.date, date) || other.date == date)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,studentId,date,datetime,status);

@override
String toString() {
  return 'Attendance(id: $id, schoolId: $schoolId, classId: $classId, studentId: $studentId, date: $date, datetime: $datetime, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AttendanceCopyWith<$Res> implements $AttendanceCopyWith<$Res> {
  factory _$AttendanceCopyWith(_Attendance value, $Res Function(_Attendance) _then) = __$AttendanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, String studentId, String date, DateTime datetime, AttendanceStatus status
});




}
/// @nodoc
class __$AttendanceCopyWithImpl<$Res>
    implements _$AttendanceCopyWith<$Res> {
  __$AttendanceCopyWithImpl(this._self, this._then);

  final _Attendance _self;
  final $Res Function(_Attendance) _then;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? studentId = null,Object? date = null,Object? datetime = null,Object? status = null,}) {
  return _then(_Attendance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,
  ));
}


}

// dart format on
