// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Group {

@JsonKey(includeToJson: false, name: '_id') String get id; String get classId; String get schoolId; String get name; Area? get area; List<String> get studentIds; bool get primary;
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCopyWith<Group> get copyWith => _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Group&&(identical(other.id, id) || other.id == id)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.area, area) || other.area == area)&&const DeepCollectionEquality().equals(other.studentIds, studentIds)&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,classId,schoolId,name,area,const DeepCollectionEquality().hash(studentIds),primary);

@override
String toString() {
  return 'Group(id: $id, classId: $classId, schoolId: $schoolId, name: $name, area: $area, studentIds: $studentIds, primary: $primary)';
}


}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res>  {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) = _$GroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String classId, String schoolId, String name, Area? area, List<String> studentIds, bool primary
});




}
/// @nodoc
class _$GroupCopyWithImpl<$Res>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? classId = null,Object? schoolId = null,Object? name = null,Object? area = freezed,Object? studentIds = null,Object? primary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area?,studentIds: null == studentIds ? _self.studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Group implements Group {
  const _Group({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.classId, required this.schoolId, required this.name, this.area, required final  List<String> studentIds, this.primary = false}): _studentIds = studentIds;
  factory _Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String classId;
@override final  String schoolId;
@override final  String name;
@override final  Area? area;
 final  List<String> _studentIds;
@override List<String> get studentIds {
  if (_studentIds is EqualUnmodifiableListView) return _studentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_studentIds);
}

@override@JsonKey() final  bool primary;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCopyWith<_Group> get copyWith => __$GroupCopyWithImpl<_Group>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Group&&(identical(other.id, id) || other.id == id)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.area, area) || other.area == area)&&const DeepCollectionEquality().equals(other._studentIds, _studentIds)&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,classId,schoolId,name,area,const DeepCollectionEquality().hash(_studentIds),primary);

@override
String toString() {
  return 'Group(id: $id, classId: $classId, schoolId: $schoolId, name: $name, area: $area, studentIds: $studentIds, primary: $primary)';
}


}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) = __$GroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String classId, String schoolId, String name, Area? area, List<String> studentIds, bool primary
});




}
/// @nodoc
class __$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? classId = null,Object? schoolId = null,Object? name = null,Object? area = freezed,Object? studentIds = null,Object? primary = null,}) {
  return _then(_Group(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area?,studentIds: null == studentIds ? _self._studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
