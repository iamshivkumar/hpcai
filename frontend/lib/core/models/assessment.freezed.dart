// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssessmentElement {

 int get index; String? get instruction; AssessmentElementType get type;//likeart, quiz, grid,
 dynamic get value;
/// Create a copy of AssessmentElement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentElementCopyWith<AssessmentElement> get copyWith => _$AssessmentElementCopyWithImpl<AssessmentElement>(this as AssessmentElement, _$identity);

  /// Serializes this AssessmentElement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessmentElement&&(identical(other.index, index) || other.index == index)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,instruction,type,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AssessmentElement(index: $index, instruction: $instruction, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $AssessmentElementCopyWith<$Res>  {
  factory $AssessmentElementCopyWith(AssessmentElement value, $Res Function(AssessmentElement) _then) = _$AssessmentElementCopyWithImpl;
@useResult
$Res call({
 int index, String? instruction, AssessmentElementType type, dynamic value
});




}
/// @nodoc
class _$AssessmentElementCopyWithImpl<$Res>
    implements $AssessmentElementCopyWith<$Res> {
  _$AssessmentElementCopyWithImpl(this._self, this._then);

  final AssessmentElement _self;
  final $Res Function(AssessmentElement) _then;

/// Create a copy of AssessmentElement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? instruction = freezed,Object? type = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,instruction: freezed == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssessmentElementType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AssessmentElement implements AssessmentElement {
   _AssessmentElement({required this.index, this.instruction, required this.type, this.value});
  factory _AssessmentElement.fromJson(Map<String, dynamic> json) => _$AssessmentElementFromJson(json);

@override final  int index;
@override final  String? instruction;
@override final  AssessmentElementType type;
//likeart, quiz, grid,
@override final  dynamic value;

/// Create a copy of AssessmentElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentElementCopyWith<_AssessmentElement> get copyWith => __$AssessmentElementCopyWithImpl<_AssessmentElement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessmentElement&&(identical(other.index, index) || other.index == index)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,instruction,type,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AssessmentElement(index: $index, instruction: $instruction, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$AssessmentElementCopyWith<$Res> implements $AssessmentElementCopyWith<$Res> {
  factory _$AssessmentElementCopyWith(_AssessmentElement value, $Res Function(_AssessmentElement) _then) = __$AssessmentElementCopyWithImpl;
@override @useResult
$Res call({
 int index, String? instruction, AssessmentElementType type, dynamic value
});




}
/// @nodoc
class __$AssessmentElementCopyWithImpl<$Res>
    implements _$AssessmentElementCopyWith<$Res> {
  __$AssessmentElementCopyWithImpl(this._self, this._then);

  final _AssessmentElement _self;
  final $Res Function(_AssessmentElement) _then;

/// Create a copy of AssessmentElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? instruction = freezed,Object? type = null,Object? value = freezed,}) {
  return _then(_AssessmentElement(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,instruction: freezed == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssessmentElementType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$AssessmentSection {

 String get key; int get index; String? get name; List<AssessmentElement> get elements;
/// Create a copy of AssessmentSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentSectionCopyWith<AssessmentSection> get copyWith => _$AssessmentSectionCopyWithImpl<AssessmentSection>(this as AssessmentSection, _$identity);

  /// Serializes this AssessmentSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessmentSection&&(identical(other.key, key) || other.key == key)&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.elements, elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,index,name,const DeepCollectionEquality().hash(elements));

@override
String toString() {
  return 'AssessmentSection(key: $key, index: $index, name: $name, elements: $elements)';
}


}

/// @nodoc
abstract mixin class $AssessmentSectionCopyWith<$Res>  {
  factory $AssessmentSectionCopyWith(AssessmentSection value, $Res Function(AssessmentSection) _then) = _$AssessmentSectionCopyWithImpl;
@useResult
$Res call({
 String key, int index, String? name, List<AssessmentElement> elements
});




}
/// @nodoc
class _$AssessmentSectionCopyWithImpl<$Res>
    implements $AssessmentSectionCopyWith<$Res> {
  _$AssessmentSectionCopyWithImpl(this._self, this._then);

  final AssessmentSection _self;
  final $Res Function(AssessmentSection) _then;

/// Create a copy of AssessmentSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? index = null,Object? name = freezed,Object? elements = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<AssessmentElement>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AssessmentSection implements AssessmentSection {
   _AssessmentSection({required this.key, required this.index, this.name, final  List<AssessmentElement> elements = const []}): _elements = elements;
  factory _AssessmentSection.fromJson(Map<String, dynamic> json) => _$AssessmentSectionFromJson(json);

@override final  String key;
@override final  int index;
@override final  String? name;
 final  List<AssessmentElement> _elements;
@override@JsonKey() List<AssessmentElement> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}


/// Create a copy of AssessmentSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentSectionCopyWith<_AssessmentSection> get copyWith => __$AssessmentSectionCopyWithImpl<_AssessmentSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessmentSection&&(identical(other.key, key) || other.key == key)&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._elements, _elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,index,name,const DeepCollectionEquality().hash(_elements));

@override
String toString() {
  return 'AssessmentSection(key: $key, index: $index, name: $name, elements: $elements)';
}


}

/// @nodoc
abstract mixin class _$AssessmentSectionCopyWith<$Res> implements $AssessmentSectionCopyWith<$Res> {
  factory _$AssessmentSectionCopyWith(_AssessmentSection value, $Res Function(_AssessmentSection) _then) = __$AssessmentSectionCopyWithImpl;
@override @useResult
$Res call({
 String key, int index, String? name, List<AssessmentElement> elements
});




}
/// @nodoc
class __$AssessmentSectionCopyWithImpl<$Res>
    implements _$AssessmentSectionCopyWith<$Res> {
  __$AssessmentSectionCopyWithImpl(this._self, this._then);

  final _AssessmentSection _self;
  final $Res Function(_AssessmentSection) _then;

/// Create a copy of AssessmentSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? index = null,Object? name = freezed,Object? elements = null,}) {
  return _then(_AssessmentSection(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<AssessmentElement>,
  ));
}


}


/// @nodoc
mixin _$Assessment {

@JsonKey(includeToJson: false, name: '_id') String get id; String get schoolId; String get classId; AssessmentType get type; String get name; String? get activityId;@JsonKey(includeToJson: false) Activity? get activity; String? get groupId; String? get studentId; Area? get area; String? get medium; String? get term;@JsonKey(includeToJson: false) List<AssessmentSection> get sections;
/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentCopyWith<Assessment> get copyWith => _$AssessmentCopyWithImpl<Assessment>(this as Assessment, _$identity);

  /// Serializes this Assessment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Assessment&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.term, term) || other.term == term)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,type,name,activityId,activity,groupId,studentId,area,medium,term,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'Assessment(id: $id, schoolId: $schoolId, classId: $classId, type: $type, name: $name, activityId: $activityId, activity: $activity, groupId: $groupId, studentId: $studentId, area: $area, medium: $medium, term: $term, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $AssessmentCopyWith<$Res>  {
  factory $AssessmentCopyWith(Assessment value, $Res Function(Assessment) _then) = _$AssessmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, AssessmentType type, String name, String? activityId,@JsonKey(includeToJson: false) Activity? activity, String? groupId, String? studentId, Area? area, String? medium, String? term,@JsonKey(includeToJson: false) List<AssessmentSection> sections
});


$ActivityCopyWith<$Res>? get activity;

}
/// @nodoc
class _$AssessmentCopyWithImpl<$Res>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._self, this._then);

  final Assessment _self;
  final $Res Function(Assessment) _then;

/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? type = null,Object? name = null,Object? activityId = freezed,Object? activity = freezed,Object? groupId = freezed,Object? studentId = freezed,Object? area = freezed,Object? medium = freezed,Object? term = freezed,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssessmentType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,activityId: freezed == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String?,activity: freezed == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as Activity?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<AssessmentSection>,
  ));
}
/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityCopyWith<$Res>? get activity {
    if (_self.activity == null) {
    return null;
  }

  return $ActivityCopyWith<$Res>(_self.activity!, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Assessment implements Assessment {
   _Assessment({@JsonKey(includeToJson: false, name: '_id') required this.id, required this.schoolId, required this.classId, required this.type, required this.name, this.activityId, @JsonKey(includeToJson: false) this.activity, this.groupId, this.studentId, this.area, this.medium, this.term, @JsonKey(includeToJson: false) final  List<AssessmentSection> sections = const []}): _sections = sections;
  factory _Assessment.fromJson(Map<String, dynamic> json) => _$AssessmentFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String schoolId;
@override final  String classId;
@override final  AssessmentType type;
@override final  String name;
@override final  String? activityId;
@override@JsonKey(includeToJson: false) final  Activity? activity;
@override final  String? groupId;
@override final  String? studentId;
@override final  Area? area;
@override final  String? medium;
@override final  String? term;
 final  List<AssessmentSection> _sections;
@override@JsonKey(includeToJson: false) List<AssessmentSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentCopyWith<_Assessment> get copyWith => __$AssessmentCopyWithImpl<_Assessment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Assessment&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.term, term) || other.term == term)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,classId,type,name,activityId,activity,groupId,studentId,area,medium,term,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'Assessment(id: $id, schoolId: $schoolId, classId: $classId, type: $type, name: $name, activityId: $activityId, activity: $activity, groupId: $groupId, studentId: $studentId, area: $area, medium: $medium, term: $term, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$AssessmentCopyWith<$Res> implements $AssessmentCopyWith<$Res> {
  factory _$AssessmentCopyWith(_Assessment value, $Res Function(_Assessment) _then) = __$AssessmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String schoolId, String classId, AssessmentType type, String name, String? activityId,@JsonKey(includeToJson: false) Activity? activity, String? groupId, String? studentId, Area? area, String? medium, String? term,@JsonKey(includeToJson: false) List<AssessmentSection> sections
});


@override $ActivityCopyWith<$Res>? get activity;

}
/// @nodoc
class __$AssessmentCopyWithImpl<$Res>
    implements _$AssessmentCopyWith<$Res> {
  __$AssessmentCopyWithImpl(this._self, this._then);

  final _Assessment _self;
  final $Res Function(_Assessment) _then;

/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? classId = null,Object? type = null,Object? name = null,Object? activityId = freezed,Object? activity = freezed,Object? groupId = freezed,Object? studentId = freezed,Object? area = freezed,Object? medium = freezed,Object? term = freezed,Object? sections = null,}) {
  return _then(_Assessment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssessmentType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,activityId: freezed == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String?,activity: freezed == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as Activity?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<AssessmentSection>,
  ));
}

/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityCopyWith<$Res>? get activity {
    if (_self.activity == null) {
    return null;
  }

  return $ActivityCopyWith<$Res>(_self.activity!, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// @nodoc
mixin _$LikeartItem {

 int get index; String get key; String get value;
/// Create a copy of LikeartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeartItemCopyWith<LikeartItem> get copyWith => _$LikeartItemCopyWithImpl<LikeartItem>(this as LikeartItem, _$identity);

  /// Serializes this LikeartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeartItem&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,value);

@override
String toString() {
  return 'LikeartItem(index: $index, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $LikeartItemCopyWith<$Res>  {
  factory $LikeartItemCopyWith(LikeartItem value, $Res Function(LikeartItem) _then) = _$LikeartItemCopyWithImpl;
@useResult
$Res call({
 int index, String key, String value
});




}
/// @nodoc
class _$LikeartItemCopyWithImpl<$Res>
    implements $LikeartItemCopyWith<$Res> {
  _$LikeartItemCopyWithImpl(this._self, this._then);

  final LikeartItem _self;
  final $Res Function(LikeartItem) _then;

/// Create a copy of LikeartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LikeartItem implements LikeartItem {
   _LikeartItem({required this.index, required this.key, required this.value});
  factory _LikeartItem.fromJson(Map<String, dynamic> json) => _$LikeartItemFromJson(json);

@override final  int index;
@override final  String key;
@override final  String value;

/// Create a copy of LikeartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeartItemCopyWith<_LikeartItem> get copyWith => __$LikeartItemCopyWithImpl<_LikeartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikeartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeartItem&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,value);

@override
String toString() {
  return 'LikeartItem(index: $index, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$LikeartItemCopyWith<$Res> implements $LikeartItemCopyWith<$Res> {
  factory _$LikeartItemCopyWith(_LikeartItem value, $Res Function(_LikeartItem) _then) = __$LikeartItemCopyWithImpl;
@override @useResult
$Res call({
 int index, String key, String value
});




}
/// @nodoc
class __$LikeartItemCopyWithImpl<$Res>
    implements _$LikeartItemCopyWith<$Res> {
  __$LikeartItemCopyWithImpl(this._self, this._then);

  final _LikeartItem _self;
  final $Res Function(_LikeartItem) _then;

/// Create a copy of LikeartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? key = null,Object? value = null,}) {
  return _then(_LikeartItem(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuizItem {

 int get index; String get key; String? get question;@JsonKey(unknownEnumValue: QuizItemType.none) QuizItemType get type; List<QuizItemOption>? get options;
/// Create a copy of QuizItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizItemCopyWith<QuizItem> get copyWith => _$QuizItemCopyWithImpl<QuizItem>(this as QuizItem, _$identity);

  /// Serializes this QuizItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizItem&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.question, question) || other.question == question)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,question,type,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'QuizItem(index: $index, key: $key, question: $question, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class $QuizItemCopyWith<$Res>  {
  factory $QuizItemCopyWith(QuizItem value, $Res Function(QuizItem) _then) = _$QuizItemCopyWithImpl;
@useResult
$Res call({
 int index, String key, String? question,@JsonKey(unknownEnumValue: QuizItemType.none) QuizItemType type, List<QuizItemOption>? options
});




}
/// @nodoc
class _$QuizItemCopyWithImpl<$Res>
    implements $QuizItemCopyWith<$Res> {
  _$QuizItemCopyWithImpl(this._self, this._then);

  final QuizItem _self;
  final $Res Function(QuizItem) _then;

/// Create a copy of QuizItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? key = null,Object? question = freezed,Object? type = null,Object? options = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizItemType,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<QuizItemOption>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _QuizItem implements QuizItem {
   _QuizItem({required this.index, required this.key, this.question, @JsonKey(unknownEnumValue: QuizItemType.none) required this.type, final  List<QuizItemOption>? options}): _options = options;
  factory _QuizItem.fromJson(Map<String, dynamic> json) => _$QuizItemFromJson(json);

@override final  int index;
@override final  String key;
@override final  String? question;
@override@JsonKey(unknownEnumValue: QuizItemType.none) final  QuizItemType type;
 final  List<QuizItemOption>? _options;
@override List<QuizItemOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuizItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizItemCopyWith<_QuizItem> get copyWith => __$QuizItemCopyWithImpl<_QuizItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizItem&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.question, question) || other.question == question)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,question,type,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'QuizItem(index: $index, key: $key, question: $question, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class _$QuizItemCopyWith<$Res> implements $QuizItemCopyWith<$Res> {
  factory _$QuizItemCopyWith(_QuizItem value, $Res Function(_QuizItem) _then) = __$QuizItemCopyWithImpl;
@override @useResult
$Res call({
 int index, String key, String? question,@JsonKey(unknownEnumValue: QuizItemType.none) QuizItemType type, List<QuizItemOption>? options
});




}
/// @nodoc
class __$QuizItemCopyWithImpl<$Res>
    implements _$QuizItemCopyWith<$Res> {
  __$QuizItemCopyWithImpl(this._self, this._then);

  final _QuizItem _self;
  final $Res Function(_QuizItem) _then;

/// Create a copy of QuizItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? key = null,Object? question = freezed,Object? type = null,Object? options = freezed,}) {
  return _then(_QuizItem(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizItemType,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<QuizItemOption>?,
  ));
}


}


/// @nodoc
mixin _$QuizItemOption {

 int get index; String get key; String get value;
/// Create a copy of QuizItemOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizItemOptionCopyWith<QuizItemOption> get copyWith => _$QuizItemOptionCopyWithImpl<QuizItemOption>(this as QuizItemOption, _$identity);

  /// Serializes this QuizItemOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizItemOption&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,value);

@override
String toString() {
  return 'QuizItemOption(index: $index, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $QuizItemOptionCopyWith<$Res>  {
  factory $QuizItemOptionCopyWith(QuizItemOption value, $Res Function(QuizItemOption) _then) = _$QuizItemOptionCopyWithImpl;
@useResult
$Res call({
 int index, String key, String value
});




}
/// @nodoc
class _$QuizItemOptionCopyWithImpl<$Res>
    implements $QuizItemOptionCopyWith<$Res> {
  _$QuizItemOptionCopyWithImpl(this._self, this._then);

  final QuizItemOption _self;
  final $Res Function(QuizItemOption) _then;

/// Create a copy of QuizItemOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _QuizItemOption implements QuizItemOption {
   _QuizItemOption({required this.index, required this.key, required this.value});
  factory _QuizItemOption.fromJson(Map<String, dynamic> json) => _$QuizItemOptionFromJson(json);

@override final  int index;
@override final  String key;
@override final  String value;

/// Create a copy of QuizItemOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizItemOptionCopyWith<_QuizItemOption> get copyWith => __$QuizItemOptionCopyWithImpl<_QuizItemOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizItemOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizItemOption&&(identical(other.index, index) || other.index == index)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,key,value);

@override
String toString() {
  return 'QuizItemOption(index: $index, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$QuizItemOptionCopyWith<$Res> implements $QuizItemOptionCopyWith<$Res> {
  factory _$QuizItemOptionCopyWith(_QuizItemOption value, $Res Function(_QuizItemOption) _then) = __$QuizItemOptionCopyWithImpl;
@override @useResult
$Res call({
 int index, String key, String value
});




}
/// @nodoc
class __$QuizItemOptionCopyWithImpl<$Res>
    implements _$QuizItemOptionCopyWith<$Res> {
  __$QuizItemOptionCopyWithImpl(this._self, this._then);

  final _QuizItemOption _self;
  final $Res Function(_QuizItemOption) _then;

/// Create a copy of QuizItemOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? key = null,Object? value = null,}) {
  return _then(_QuizItemOption(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
