// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evolution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Evolution {

@JsonKey(includeToJson: false, name: '_id') String get id; String get schoolId; String get classId; String get assessmentId; String get studentId; Map<String, dynamic> get data;
/// Create a copy of Evolution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvolutionCopyWith<Evolution> get copyWith => _$EvolutionCopyWithImpl<Evolution>(this as Evolution, _$identity);

  /// Serializes this Evolution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Evolution&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.assessmentId, assessmentId) || other.assessmentId == assessmentId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,assessmentId,studentId,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Evolution(id: $id, schoolId: $schoolId, classId: $classId, assessmentId: $assessmentId, studentId: $studentId, data: $data)';
}


}

/// @nodoc
abstract mixin class $EvolutionCopyWith<$Res>  {
  factory $EvolutionCopyWith(Evolution value, $Res Function(Evolution) _then) = _$EvolutionCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, String assessmentId, String studentId, Map<String, dynamic> data
});




}
/// @nodoc
class _$EvolutionCopyWithImpl<$Res>
    implements $EvolutionCopyWith<$Res> {
  _$EvolutionCopyWithImpl(this._self, this._then);

  final Evolution _self;
  final $Res Function(Evolution) _then;

/// Create a copy of Evolution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? assessmentId = null,Object? studentId = null,Object? data = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,assessmentId: null == assessmentId ? _self.assessmentId : assessmentId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Evolution implements Evolution {
   _Evolution({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.schoolId, required this.classId, required this.assessmentId, required this.studentId, final  Map<String, dynamic> data = const {}}): _data = data;
  factory _Evolution.fromJson(Map<String, dynamic> json) => _$EvolutionFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String schoolId;
@override final  String classId;
@override final  String assessmentId;
@override final  String studentId;
 final  Map<String, dynamic> _data;
@override@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of Evolution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvolutionCopyWith<_Evolution> get copyWith => __$EvolutionCopyWithImpl<_Evolution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvolutionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Evolution&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.assessmentId, assessmentId) || other.assessmentId == assessmentId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,assessmentId,studentId,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Evolution(id: $id, schoolId: $schoolId, classId: $classId, assessmentId: $assessmentId, studentId: $studentId, data: $data)';
}


}

/// @nodoc
abstract mixin class _$EvolutionCopyWith<$Res> implements $EvolutionCopyWith<$Res> {
  factory _$EvolutionCopyWith(_Evolution value, $Res Function(_Evolution) _then) = __$EvolutionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, String assessmentId, String studentId, Map<String, dynamic> data
});




}
/// @nodoc
class __$EvolutionCopyWithImpl<$Res>
    implements _$EvolutionCopyWith<$Res> {
  __$EvolutionCopyWithImpl(this._self, this._then);

  final _Evolution _self;
  final $Res Function(_Evolution) _then;

/// Create a copy of Evolution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? assessmentId = null,Object? studentId = null,Object? data = null,}) {
  return _then(_Evolution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,assessmentId: null == assessmentId ? _self.assessmentId : assessmentId // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
