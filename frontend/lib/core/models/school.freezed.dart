// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$School {

@JsonKey(includeToJson: false, name: '_id') String get id; String get name; String? get logo; String get address; String get udise; String get board; String get ownerId;
/// Create a copy of School
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolCopyWith<School> get copyWith => _$SchoolCopyWithImpl<School>(this as School, _$identity);

  /// Serializes this School to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is School&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.address, address) || other.address == address)&&(identical(other.udise, udise) || other.udise == udise)&&(identical(other.board, board) || other.board == board)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo,address,udise,board,ownerId);

@override
String toString() {
  return 'School(id: $id, name: $name, logo: $logo, address: $address, udise: $udise, board: $board, ownerId: $ownerId)';
}


}

/// @nodoc
abstract mixin class $SchoolCopyWith<$Res>  {
  factory $SchoolCopyWith(School value, $Res Function(School) _then) = _$SchoolCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String name, String? logo, String address, String udise, String board, String ownerId
});




}
/// @nodoc
class _$SchoolCopyWithImpl<$Res>
    implements $SchoolCopyWith<$Res> {
  _$SchoolCopyWithImpl(this._self, this._then);

  final School _self;
  final $Res Function(School) _then;

/// Create a copy of School
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logo = freezed,Object? address = null,Object? udise = null,Object? board = null,Object? ownerId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,udise: null == udise ? _self.udise : udise // ignore: cast_nullable_to_non_nullable
as String,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _School implements School {
  const _School({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.name, this.logo, required this.address, required this.udise, this.board = "CBSE", required this.ownerId});
  factory _School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String name;
@override final  String? logo;
@override final  String address;
@override final  String udise;
@override@JsonKey() final  String board;
@override final  String ownerId;

/// Create a copy of School
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolCopyWith<_School> get copyWith => __$SchoolCopyWithImpl<_School>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _School&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.address, address) || other.address == address)&&(identical(other.udise, udise) || other.udise == udise)&&(identical(other.board, board) || other.board == board)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo,address,udise,board,ownerId);

@override
String toString() {
  return 'School(id: $id, name: $name, logo: $logo, address: $address, udise: $udise, board: $board, ownerId: $ownerId)';
}


}

/// @nodoc
abstract mixin class _$SchoolCopyWith<$Res> implements $SchoolCopyWith<$Res> {
  factory _$SchoolCopyWith(_School value, $Res Function(_School) _then) = __$SchoolCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String name, String? logo, String address, String udise, String board, String ownerId
});




}
/// @nodoc
class __$SchoolCopyWithImpl<$Res>
    implements _$SchoolCopyWith<$Res> {
  __$SchoolCopyWithImpl(this._self, this._then);

  final _School _self;
  final $Res Function(_School) _then;

/// Create a copy of School
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logo = freezed,Object? address = null,Object? udise = null,Object? board = null,Object? ownerId = null,}) {
  return _then(_School(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,udise: null == udise ? _self.udise : udise // ignore: cast_nullable_to_non_nullable
as String,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
