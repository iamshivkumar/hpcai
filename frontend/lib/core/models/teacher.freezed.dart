// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Teacher {

@JsonKey(includeToJson: false, name: '_id') String get id; String get schoolId; String get name; String? get image;
/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCopyWith<Teacher> get copyWith => _$TeacherCopyWithImpl<Teacher>(this as Teacher, _$identity);

  /// Serializes this Teacher to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Teacher&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,image);

@override
String toString() {
  return 'Teacher(id: $id, schoolId: $schoolId, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $TeacherCopyWith<$Res>  {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) _then) = _$TeacherCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String name, String? image
});




}
/// @nodoc
class _$TeacherCopyWithImpl<$Res>
    implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._self, this._then);

  final Teacher _self;
  final $Res Function(Teacher) _then;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Teacher implements Teacher {
  const _Teacher({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.schoolId, required this.name, this.image});
  factory _Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String schoolId;
@override final  String name;
@override final  String? image;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCopyWith<_Teacher> get copyWith => __$TeacherCopyWithImpl<_Teacher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Teacher&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,image);

@override
String toString() {
  return 'Teacher(id: $id, schoolId: $schoolId, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$TeacherCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$TeacherCopyWith(_Teacher value, $Res Function(_Teacher) _then) = __$TeacherCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String name, String? image
});




}
/// @nodoc
class __$TeacherCopyWithImpl<$Res>
    implements _$TeacherCopyWith<$Res> {
  __$TeacherCopyWithImpl(this._self, this._then);

  final _Teacher _self;
  final $Res Function(_Teacher) _then;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? image = freezed,}) {
  return _then(_Teacher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
