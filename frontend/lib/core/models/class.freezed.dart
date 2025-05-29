// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClassArea {

 Area get area; String get medium;
/// Create a copy of ClassArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassAreaCopyWith<ClassArea> get copyWith => _$ClassAreaCopyWithImpl<ClassArea>(this as ClassArea, _$identity);

  /// Serializes this ClassArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassArea&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,medium);

@override
String toString() {
  return 'ClassArea(area: $area, medium: $medium)';
}


}

/// @nodoc
abstract mixin class $ClassAreaCopyWith<$Res>  {
  factory $ClassAreaCopyWith(ClassArea value, $Res Function(ClassArea) _then) = _$ClassAreaCopyWithImpl;
@useResult
$Res call({
 Area area, String medium
});




}
/// @nodoc
class _$ClassAreaCopyWithImpl<$Res>
    implements $ClassAreaCopyWith<$Res> {
  _$ClassAreaCopyWithImpl(this._self, this._then);

  final ClassArea _self;
  final $Res Function(ClassArea) _then;

/// Create a copy of ClassArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? area = null,Object? medium = null,}) {
  return _then(_self.copyWith(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ClassArea implements ClassArea {
  const _ClassArea({required this.area, required this.medium});
  factory _ClassArea.fromJson(Map<String, dynamic> json) => _$ClassAreaFromJson(json);

@override final  Area area;
@override final  String medium;

/// Create a copy of ClassArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassAreaCopyWith<_ClassArea> get copyWith => __$ClassAreaCopyWithImpl<_ClassArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassAreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassArea&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,medium);

@override
String toString() {
  return 'ClassArea(area: $area, medium: $medium)';
}


}

/// @nodoc
abstract mixin class _$ClassAreaCopyWith<$Res> implements $ClassAreaCopyWith<$Res> {
  factory _$ClassAreaCopyWith(_ClassArea value, $Res Function(_ClassArea) _then) = __$ClassAreaCopyWithImpl;
@override @useResult
$Res call({
 Area area, String medium
});




}
/// @nodoc
class __$ClassAreaCopyWithImpl<$Res>
    implements _$ClassAreaCopyWith<$Res> {
  __$ClassAreaCopyWithImpl(this._self, this._then);

  final _ClassArea _self;
  final $Res Function(_ClassArea) _then;

/// Create a copy of ClassArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? area = null,Object? medium = null,}) {
  return _then(_ClassArea(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Class {

@JsonKey(includeToJson: false, name: '_id') String get id; String get schoolId; String? get teacherId; Grade get grade; String? get section; String get year; List<ClassArea> get areas;
/// Create a copy of Class
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassCopyWith<Class> get copyWith => _$ClassCopyWithImpl<Class>(this as Class, _$identity);

  /// Serializes this Class to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Class&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.section, section) || other.section == section)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other.areas, areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,teacherId,grade,section,year,const DeepCollectionEquality().hash(areas));

@override
String toString() {
  return 'Class(id: $id, schoolId: $schoolId, teacherId: $teacherId, grade: $grade, section: $section, year: $year, areas: $areas)';
}


}

/// @nodoc
abstract mixin class $ClassCopyWith<$Res>  {
  factory $ClassCopyWith(Class value, $Res Function(Class) _then) = _$ClassCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String? teacherId, Grade grade, String? section, String year, List<ClassArea> areas
});




}
/// @nodoc
class _$ClassCopyWithImpl<$Res>
    implements $ClassCopyWith<$Res> {
  _$ClassCopyWithImpl(this._self, this._then);

  final Class _self;
  final $Res Function(Class) _then;

/// Create a copy of Class
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? teacherId = freezed,Object? grade = null,Object? section = freezed,Object? year = null,Object? areas = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<ClassArea>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Class implements Class {
  const _Class({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.schoolId, this.teacherId, required this.grade, this.section, required this.year, required final  List<ClassArea> areas}): _areas = areas;
  factory _Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String schoolId;
@override final  String? teacherId;
@override final  Grade grade;
@override final  String? section;
@override final  String year;
 final  List<ClassArea> _areas;
@override List<ClassArea> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}


/// Create a copy of Class
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassCopyWith<_Class> get copyWith => __$ClassCopyWithImpl<_Class>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Class&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.section, section) || other.section == section)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other._areas, _areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,teacherId,grade,section,year,const DeepCollectionEquality().hash(_areas));

@override
String toString() {
  return 'Class(id: $id, schoolId: $schoolId, teacherId: $teacherId, grade: $grade, section: $section, year: $year, areas: $areas)';
}


}

/// @nodoc
abstract mixin class _$ClassCopyWith<$Res> implements $ClassCopyWith<$Res> {
  factory _$ClassCopyWith(_Class value, $Res Function(_Class) _then) = __$ClassCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String? teacherId, Grade grade, String? section, String year, List<ClassArea> areas
});




}
/// @nodoc
class __$ClassCopyWithImpl<$Res>
    implements _$ClassCopyWith<$Res> {
  __$ClassCopyWithImpl(this._self, this._then);

  final _Class _self;
  final $Res Function(_Class) _then;

/// Create a copy of Class
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? teacherId = freezed,Object? grade = null,Object? section = freezed,Object? year = null,Object? areas = null,}) {
  return _then(_Class(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<ClassArea>,
  ));
}


}

// dart format on
