// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flex_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlexForm {

 String get id; String get key; bool get system;/// test, assesssment, info
 FlexFormType get type; String? get schoolId; String? get classId; String? get subjectId; String? get groupId; List<String>? get studentIds; String get title; String? get description; String? get image; String? get icon; String? get cover;/// minutes
 int? get duration; List<FlexFormField> get fields; String get status;
/// Create a copy of FlexForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlexFormCopyWith<FlexForm> get copyWith => _$FlexFormCopyWithImpl<FlexForm>(this as FlexForm, _$identity);

  /// Serializes this FlexForm to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlexForm&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.system, system) || other.system == system)&&(identical(other.type, type) || other.type == type)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.studentIds, studentIds)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,system,type,schoolId,classId,subjectId,groupId,const DeepCollectionEquality().hash(studentIds),title,description,image,icon,cover,duration,const DeepCollectionEquality().hash(fields),status);

@override
String toString() {
  return 'FlexForm(id: $id, key: $key, system: $system, type: $type, schoolId: $schoolId, classId: $classId, subjectId: $subjectId, groupId: $groupId, studentIds: $studentIds, title: $title, description: $description, image: $image, icon: $icon, cover: $cover, duration: $duration, fields: $fields, status: $status)';
}


}

/// @nodoc
abstract mixin class $FlexFormCopyWith<$Res>  {
  factory $FlexFormCopyWith(FlexForm value, $Res Function(FlexForm) _then) = _$FlexFormCopyWithImpl;
@useResult
$Res call({
 String id, String key, bool system, FlexFormType type, String? schoolId, String? classId, String? subjectId, String? groupId, List<String>? studentIds, String title, String? description, String? image, String? icon, String? cover, int? duration, List<FlexFormField> fields, String status
});




}
/// @nodoc
class _$FlexFormCopyWithImpl<$Res>
    implements $FlexFormCopyWith<$Res> {
  _$FlexFormCopyWithImpl(this._self, this._then);

  final FlexForm _self;
  final $Res Function(FlexForm) _then;

/// Create a copy of FlexForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? system = null,Object? type = null,Object? schoolId = freezed,Object? classId = freezed,Object? subjectId = freezed,Object? groupId = freezed,Object? studentIds = freezed,Object? title = null,Object? description = freezed,Object? image = freezed,Object? icon = freezed,Object? cover = freezed,Object? duration = freezed,Object? fields = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FlexFormType,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,studentIds: freezed == studentIds ? _self.studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<FlexFormField>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FlexForm implements FlexForm {
   _FlexForm({required this.id, required this.key, this.system = false, required this.type, this.schoolId, this.classId, this.subjectId, this.groupId, final  List<String>? studentIds, required this.title, this.description, this.image, this.icon, this.cover, this.duration, final  List<FlexFormField> fields = const [], required this.status}): _studentIds = studentIds,_fields = fields;
  factory _FlexForm.fromJson(Map<String, dynamic> json) => _$FlexFormFromJson(json);

@override final  String id;
@override final  String key;
@override@JsonKey() final  bool system;
/// test, assesssment, info
@override final  FlexFormType type;
@override final  String? schoolId;
@override final  String? classId;
@override final  String? subjectId;
@override final  String? groupId;
 final  List<String>? _studentIds;
@override List<String>? get studentIds {
  final value = _studentIds;
  if (value == null) return null;
  if (_studentIds is EqualUnmodifiableListView) return _studentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String title;
@override final  String? description;
@override final  String? image;
@override final  String? icon;
@override final  String? cover;
/// minutes
@override final  int? duration;
 final  List<FlexFormField> _fields;
@override@JsonKey() List<FlexFormField> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

@override final  String status;

/// Create a copy of FlexForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlexFormCopyWith<_FlexForm> get copyWith => __$FlexFormCopyWithImpl<_FlexForm>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlexFormToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlexForm&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.system, system) || other.system == system)&&(identical(other.type, type) || other.type == type)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._studentIds, _studentIds)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,system,type,schoolId,classId,subjectId,groupId,const DeepCollectionEquality().hash(_studentIds),title,description,image,icon,cover,duration,const DeepCollectionEquality().hash(_fields),status);

@override
String toString() {
  return 'FlexForm(id: $id, key: $key, system: $system, type: $type, schoolId: $schoolId, classId: $classId, subjectId: $subjectId, groupId: $groupId, studentIds: $studentIds, title: $title, description: $description, image: $image, icon: $icon, cover: $cover, duration: $duration, fields: $fields, status: $status)';
}


}

/// @nodoc
abstract mixin class _$FlexFormCopyWith<$Res> implements $FlexFormCopyWith<$Res> {
  factory _$FlexFormCopyWith(_FlexForm value, $Res Function(_FlexForm) _then) = __$FlexFormCopyWithImpl;
@override @useResult
$Res call({
 String id, String key, bool system, FlexFormType type, String? schoolId, String? classId, String? subjectId, String? groupId, List<String>? studentIds, String title, String? description, String? image, String? icon, String? cover, int? duration, List<FlexFormField> fields, String status
});




}
/// @nodoc
class __$FlexFormCopyWithImpl<$Res>
    implements _$FlexFormCopyWith<$Res> {
  __$FlexFormCopyWithImpl(this._self, this._then);

  final _FlexForm _self;
  final $Res Function(_FlexForm) _then;

/// Create a copy of FlexForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? system = null,Object? type = null,Object? schoolId = freezed,Object? classId = freezed,Object? subjectId = freezed,Object? groupId = freezed,Object? studentIds = freezed,Object? title = null,Object? description = freezed,Object? image = freezed,Object? icon = freezed,Object? cover = freezed,Object? duration = freezed,Object? fields = null,Object? status = null,}) {
  return _then(_FlexForm(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FlexFormType,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,studentIds: freezed == studentIds ? _self._studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<FlexFormField>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FlexFormField {

// number, phone, email, text, choice, level*, rubric, date, datetime, time, currency(rupee), file, link, true-false,
 String get type; String get key; bool? get required; String? get title; String? get titlePrefix; String? get titleSuffix; String? get image; String? get description; String? get note;/// common
 int? get length; String? get regex; String? get hintText; String? get helperText; String? get prefix; String? get suffix;/// for text, choice
 bool? get multiple;/// for text
 bool? get long;/// for text-multiple, choice-multiple,
 int? get limit;/// suggestion related
///
/// shortAnswer
 String? get maskText;/// test
 int? get points;/// points
/// data
 int? get outOf;/// date, time
 String? get format;/// number
 int? get max; int? get min;/// for text
 int? get minLines; int? get maxLines;// png, mp4, pdf
 List<String>? get fileTypes;/// choices
 List<String>? get choices; String? get choiceSource;/// choice-!multiple
 bool? get dropdown; Map<String, String>? get rubric; dynamic get default$;
/// Create a copy of FlexFormField
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlexFormFieldCopyWith<FlexFormField> get copyWith => _$FlexFormFieldCopyWithImpl<FlexFormField>(this as FlexFormField, _$identity);

  /// Serializes this FlexFormField to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlexFormField&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.required, required) || other.required == required)&&(identical(other.title, title) || other.title == title)&&(identical(other.titlePrefix, titlePrefix) || other.titlePrefix == titlePrefix)&&(identical(other.titleSuffix, titleSuffix) || other.titleSuffix == titleSuffix)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.length, length) || other.length == length)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.helperText, helperText) || other.helperText == helperText)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.multiple, multiple) || other.multiple == multiple)&&(identical(other.long, long) || other.long == long)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.maskText, maskText) || other.maskText == maskText)&&(identical(other.points, points) || other.points == points)&&(identical(other.outOf, outOf) || other.outOf == outOf)&&(identical(other.format, format) || other.format == format)&&(identical(other.max, max) || other.max == max)&&(identical(other.min, min) || other.min == min)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&const DeepCollectionEquality().equals(other.fileTypes, fileTypes)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.choiceSource, choiceSource) || other.choiceSource == choiceSource)&&(identical(other.dropdown, dropdown) || other.dropdown == dropdown)&&const DeepCollectionEquality().equals(other.rubric, rubric)&&const DeepCollectionEquality().equals(other.default$, default$));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,key,required,title,titlePrefix,titleSuffix,image,description,note,length,regex,hintText,helperText,prefix,suffix,multiple,long,limit,maskText,points,outOf,format,max,min,minLines,maxLines,const DeepCollectionEquality().hash(fileTypes),const DeepCollectionEquality().hash(choices),choiceSource,dropdown,const DeepCollectionEquality().hash(rubric),const DeepCollectionEquality().hash(default$)]);

@override
String toString() {
  return 'FlexFormField(type: $type, key: $key, required: $required, title: $title, titlePrefix: $titlePrefix, titleSuffix: $titleSuffix, image: $image, description: $description, note: $note, length: $length, regex: $regex, hintText: $hintText, helperText: $helperText, prefix: $prefix, suffix: $suffix, multiple: $multiple, long: $long, limit: $limit, maskText: $maskText, points: $points, outOf: $outOf, format: $format, max: $max, min: $min, minLines: $minLines, maxLines: $maxLines, fileTypes: $fileTypes, choices: $choices, choiceSource: $choiceSource, dropdown: $dropdown, rubric: $rubric, default\$: ${default$})';
}


}

/// @nodoc
abstract mixin class $FlexFormFieldCopyWith<$Res>  {
  factory $FlexFormFieldCopyWith(FlexFormField value, $Res Function(FlexFormField) _then) = _$FlexFormFieldCopyWithImpl;
@useResult
$Res call({
 String type, String key, bool? required, String? title, String? titlePrefix, String? titleSuffix, String? image, String? description, String? note, int? length, String? regex, String? hintText, String? helperText, String? prefix, String? suffix, bool? multiple, bool? long, int? limit, String? maskText, int? points, int? outOf, String? format, int? max, int? min, int? minLines, int? maxLines, List<String>? fileTypes, List<String>? choices, String? choiceSource, bool? dropdown, Map<String, String>? rubric, dynamic default$
});




}
/// @nodoc
class _$FlexFormFieldCopyWithImpl<$Res>
    implements $FlexFormFieldCopyWith<$Res> {
  _$FlexFormFieldCopyWithImpl(this._self, this._then);

  final FlexFormField _self;
  final $Res Function(FlexFormField) _then;

/// Create a copy of FlexFormField
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? key = null,Object? required = freezed,Object? title = freezed,Object? titlePrefix = freezed,Object? titleSuffix = freezed,Object? image = freezed,Object? description = freezed,Object? note = freezed,Object? length = freezed,Object? regex = freezed,Object? hintText = freezed,Object? helperText = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? multiple = freezed,Object? long = freezed,Object? limit = freezed,Object? maskText = freezed,Object? points = freezed,Object? outOf = freezed,Object? format = freezed,Object? max = freezed,Object? min = freezed,Object? minLines = freezed,Object? maxLines = freezed,Object? fileTypes = freezed,Object? choices = freezed,Object? choiceSource = freezed,Object? dropdown = freezed,Object? rubric = freezed,Object? default$ = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,required: freezed == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titlePrefix: freezed == titlePrefix ? _self.titlePrefix : titlePrefix // ignore: cast_nullable_to_non_nullable
as String?,titleSuffix: freezed == titleSuffix ? _self.titleSuffix : titleSuffix // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,multiple: freezed == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as bool?,long: freezed == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as bool?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,maskText: freezed == maskText ? _self.maskText : maskText // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,outOf: freezed == outOf ? _self.outOf : outOf // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,fileTypes: freezed == fileTypes ? _self.fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,choices: freezed == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,choiceSource: freezed == choiceSource ? _self.choiceSource : choiceSource // ignore: cast_nullable_to_non_nullable
as String?,dropdown: freezed == dropdown ? _self.dropdown : dropdown // ignore: cast_nullable_to_non_nullable
as bool?,rubric: freezed == rubric ? _self.rubric : rubric // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,default$: freezed == default$ ? _self.default$ : default$ // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FlexFormField implements FlexFormField {
   _FlexFormField({required this.type, required this.key, this.required, this.title, this.titlePrefix, this.titleSuffix, this.image, this.description, this.note, this.length, this.regex, this.hintText, this.helperText, this.prefix, this.suffix, this.multiple, this.long, this.limit, this.maskText, this.points, this.outOf, this.format, this.max, this.min, this.minLines, this.maxLines, final  List<String>? fileTypes, final  List<String>? choices, this.choiceSource, this.dropdown, final  Map<String, String>? rubric, this.default$}): _fileTypes = fileTypes,_choices = choices,_rubric = rubric;
  factory _FlexFormField.fromJson(Map<String, dynamic> json) => _$FlexFormFieldFromJson(json);

// number, phone, email, text, choice, level*, rubric, date, datetime, time, currency(rupee), file, link, true-false,
@override final  String type;
@override final  String key;
@override final  bool? required;
@override final  String? title;
@override final  String? titlePrefix;
@override final  String? titleSuffix;
@override final  String? image;
@override final  String? description;
@override final  String? note;
/// common
@override final  int? length;
@override final  String? regex;
@override final  String? hintText;
@override final  String? helperText;
@override final  String? prefix;
@override final  String? suffix;
/// for text, choice
@override final  bool? multiple;
/// for text
@override final  bool? long;
/// for text-multiple, choice-multiple,
@override final  int? limit;
/// suggestion related
///
/// shortAnswer
@override final  String? maskText;
/// test
@override final  int? points;
/// points
/// data
@override final  int? outOf;
/// date, time
@override final  String? format;
/// number
@override final  int? max;
@override final  int? min;
/// for text
@override final  int? minLines;
@override final  int? maxLines;
// png, mp4, pdf
 final  List<String>? _fileTypes;
// png, mp4, pdf
@override List<String>? get fileTypes {
  final value = _fileTypes;
  if (value == null) return null;
  if (_fileTypes is EqualUnmodifiableListView) return _fileTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// choices
 final  List<String>? _choices;
/// choices
@override List<String>? get choices {
  final value = _choices;
  if (value == null) return null;
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? choiceSource;
/// choice-!multiple
@override final  bool? dropdown;
 final  Map<String, String>? _rubric;
@override Map<String, String>? get rubric {
  final value = _rubric;
  if (value == null) return null;
  if (_rubric is EqualUnmodifiableMapView) return _rubric;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  dynamic default$;

/// Create a copy of FlexFormField
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlexFormFieldCopyWith<_FlexFormField> get copyWith => __$FlexFormFieldCopyWithImpl<_FlexFormField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlexFormFieldToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlexFormField&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.required, required) || other.required == required)&&(identical(other.title, title) || other.title == title)&&(identical(other.titlePrefix, titlePrefix) || other.titlePrefix == titlePrefix)&&(identical(other.titleSuffix, titleSuffix) || other.titleSuffix == titleSuffix)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.length, length) || other.length == length)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.helperText, helperText) || other.helperText == helperText)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.multiple, multiple) || other.multiple == multiple)&&(identical(other.long, long) || other.long == long)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.maskText, maskText) || other.maskText == maskText)&&(identical(other.points, points) || other.points == points)&&(identical(other.outOf, outOf) || other.outOf == outOf)&&(identical(other.format, format) || other.format == format)&&(identical(other.max, max) || other.max == max)&&(identical(other.min, min) || other.min == min)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&const DeepCollectionEquality().equals(other._fileTypes, _fileTypes)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.choiceSource, choiceSource) || other.choiceSource == choiceSource)&&(identical(other.dropdown, dropdown) || other.dropdown == dropdown)&&const DeepCollectionEquality().equals(other._rubric, _rubric)&&const DeepCollectionEquality().equals(other.default$, default$));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,key,required,title,titlePrefix,titleSuffix,image,description,note,length,regex,hintText,helperText,prefix,suffix,multiple,long,limit,maskText,points,outOf,format,max,min,minLines,maxLines,const DeepCollectionEquality().hash(_fileTypes),const DeepCollectionEquality().hash(_choices),choiceSource,dropdown,const DeepCollectionEquality().hash(_rubric),const DeepCollectionEquality().hash(default$)]);

@override
String toString() {
  return 'FlexFormField(type: $type, key: $key, required: $required, title: $title, titlePrefix: $titlePrefix, titleSuffix: $titleSuffix, image: $image, description: $description, note: $note, length: $length, regex: $regex, hintText: $hintText, helperText: $helperText, prefix: $prefix, suffix: $suffix, multiple: $multiple, long: $long, limit: $limit, maskText: $maskText, points: $points, outOf: $outOf, format: $format, max: $max, min: $min, minLines: $minLines, maxLines: $maxLines, fileTypes: $fileTypes, choices: $choices, choiceSource: $choiceSource, dropdown: $dropdown, rubric: $rubric, default\$: ${default$})';
}


}

/// @nodoc
abstract mixin class _$FlexFormFieldCopyWith<$Res> implements $FlexFormFieldCopyWith<$Res> {
  factory _$FlexFormFieldCopyWith(_FlexFormField value, $Res Function(_FlexFormField) _then) = __$FlexFormFieldCopyWithImpl;
@override @useResult
$Res call({
 String type, String key, bool? required, String? title, String? titlePrefix, String? titleSuffix, String? image, String? description, String? note, int? length, String? regex, String? hintText, String? helperText, String? prefix, String? suffix, bool? multiple, bool? long, int? limit, String? maskText, int? points, int? outOf, String? format, int? max, int? min, int? minLines, int? maxLines, List<String>? fileTypes, List<String>? choices, String? choiceSource, bool? dropdown, Map<String, String>? rubric, dynamic default$
});




}
/// @nodoc
class __$FlexFormFieldCopyWithImpl<$Res>
    implements _$FlexFormFieldCopyWith<$Res> {
  __$FlexFormFieldCopyWithImpl(this._self, this._then);

  final _FlexFormField _self;
  final $Res Function(_FlexFormField) _then;

/// Create a copy of FlexFormField
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? key = null,Object? required = freezed,Object? title = freezed,Object? titlePrefix = freezed,Object? titleSuffix = freezed,Object? image = freezed,Object? description = freezed,Object? note = freezed,Object? length = freezed,Object? regex = freezed,Object? hintText = freezed,Object? helperText = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? multiple = freezed,Object? long = freezed,Object? limit = freezed,Object? maskText = freezed,Object? points = freezed,Object? outOf = freezed,Object? format = freezed,Object? max = freezed,Object? min = freezed,Object? minLines = freezed,Object? maxLines = freezed,Object? fileTypes = freezed,Object? choices = freezed,Object? choiceSource = freezed,Object? dropdown = freezed,Object? rubric = freezed,Object? default$ = freezed,}) {
  return _then(_FlexFormField(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,required: freezed == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titlePrefix: freezed == titlePrefix ? _self.titlePrefix : titlePrefix // ignore: cast_nullable_to_non_nullable
as String?,titleSuffix: freezed == titleSuffix ? _self.titleSuffix : titleSuffix // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,multiple: freezed == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as bool?,long: freezed == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as bool?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,maskText: freezed == maskText ? _self.maskText : maskText // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,outOf: freezed == outOf ? _self.outOf : outOf // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,fileTypes: freezed == fileTypes ? _self._fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,choices: freezed == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,choiceSource: freezed == choiceSource ? _self.choiceSource : choiceSource // ignore: cast_nullable_to_non_nullable
as String?,dropdown: freezed == dropdown ? _self.dropdown : dropdown // ignore: cast_nullable_to_non_nullable
as bool?,rubric: freezed == rubric ? _self._rubric : rubric // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,default$: freezed == default$ ? _self.default$ : default$ // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
