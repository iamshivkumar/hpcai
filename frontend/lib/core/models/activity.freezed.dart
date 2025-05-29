// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Activity {

@JsonKey(includeToJson: false, name: '_id') String get id; String? get schoolId;@GradeConverter() Grade get grade; Area get area; String? get medium; String get title; String get description; List<String>? get questions; List<String>? get pedagogies; List<String> get goals; List<String> get competencies; Map<RubricAbility, Map<RubricLevel, String>> get rubric;
/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityCopyWith<Activity> get copyWith => _$ActivityCopyWithImpl<Activity>(this as Activity, _$identity);

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Activity&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.pedagogies, pedagogies)&&const DeepCollectionEquality().equals(other.goals, goals)&&const DeepCollectionEquality().equals(other.competencies, competencies)&&const DeepCollectionEquality().equals(other.rubric, rubric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,grade,area,medium,title,description,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(pedagogies),const DeepCollectionEquality().hash(goals),const DeepCollectionEquality().hash(competencies),const DeepCollectionEquality().hash(rubric));

@override
String toString() {
  return 'Activity(id: $id, schoolId: $schoolId, grade: $grade, area: $area, medium: $medium, title: $title, description: $description, questions: $questions, pedagogies: $pedagogies, goals: $goals, competencies: $competencies, rubric: $rubric)';
}


}

/// @nodoc
abstract mixin class $ActivityCopyWith<$Res>  {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) _then) = _$ActivityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String? schoolId,@GradeConverter() Grade grade, Area area, String? medium, String title, String description, List<String>? questions, List<String>? pedagogies, List<String> goals, List<String> competencies, Map<RubricAbility, Map<RubricLevel, String>> rubric
});




}
/// @nodoc
class _$ActivityCopyWithImpl<$Res>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._self, this._then);

  final Activity _self;
  final $Res Function(Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = freezed,Object? grade = null,Object? area = null,Object? medium = freezed,Object? title = null,Object? description = null,Object? questions = freezed,Object? pedagogies = freezed,Object? goals = null,Object? competencies = null,Object? rubric = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,questions: freezed == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>?,pedagogies: freezed == pedagogies ? _self.pedagogies : pedagogies // ignore: cast_nullable_to_non_nullable
as List<String>?,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<String>,competencies: null == competencies ? _self.competencies : competencies // ignore: cast_nullable_to_non_nullable
as List<String>,rubric: null == rubric ? _self.rubric : rubric // ignore: cast_nullable_to_non_nullable
as Map<RubricAbility, Map<RubricLevel, String>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Activity implements Activity {
  const _Activity({@JsonKey(includeToJson: false, name: '_id') required this.id, this.schoolId, @GradeConverter() required this.grade, required this.area, this.medium, required this.title, required this.description, final  List<String>? questions, final  List<String>? pedagogies, final  List<String> goals = const [], final  List<String> competencies = const [], final  Map<RubricAbility, Map<RubricLevel, String>> rubric = const {}}): _questions = questions,_pedagogies = pedagogies,_goals = goals,_competencies = competencies,_rubric = rubric;
  factory _Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

@override@JsonKey(includeToJson: false, name: '_id') final  String id;
@override final  String? schoolId;
@override@GradeConverter() final  Grade grade;
@override final  Area area;
@override final  String? medium;
@override final  String title;
@override final  String description;
 final  List<String>? _questions;
@override List<String>? get questions {
  final value = _questions;
  if (value == null) return null;
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _pedagogies;
@override List<String>? get pedagogies {
  final value = _pedagogies;
  if (value == null) return null;
  if (_pedagogies is EqualUnmodifiableListView) return _pedagogies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String> _goals;
@override@JsonKey() List<String> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

 final  List<String> _competencies;
@override@JsonKey() List<String> get competencies {
  if (_competencies is EqualUnmodifiableListView) return _competencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_competencies);
}

 final  Map<RubricAbility, Map<RubricLevel, String>> _rubric;
@override@JsonKey() Map<RubricAbility, Map<RubricLevel, String>> get rubric {
  if (_rubric is EqualUnmodifiableMapView) return _rubric;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rubric);
}


/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityCopyWith<_Activity> get copyWith => __$ActivityCopyWithImpl<_Activity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Activity&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.area, area) || other.area == area)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._pedagogies, _pedagogies)&&const DeepCollectionEquality().equals(other._goals, _goals)&&const DeepCollectionEquality().equals(other._competencies, _competencies)&&const DeepCollectionEquality().equals(other._rubric, _rubric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,grade,area,medium,title,description,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_pedagogies),const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_competencies),const DeepCollectionEquality().hash(_rubric));

@override
String toString() {
  return 'Activity(id: $id, schoolId: $schoolId, grade: $grade, area: $area, medium: $medium, title: $title, description: $description, questions: $questions, pedagogies: $pedagogies, goals: $goals, competencies: $competencies, rubric: $rubric)';
}


}

/// @nodoc
abstract mixin class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) _then) = __$ActivityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, name: '_id') String id, String? schoolId,@GradeConverter() Grade grade, Area area, String? medium, String title, String description, List<String>? questions, List<String>? pedagogies, List<String> goals, List<String> competencies, Map<RubricAbility, Map<RubricLevel, String>> rubric
});




}
/// @nodoc
class __$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(this._self, this._then);

  final _Activity _self;
  final $Res Function(_Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = freezed,Object? grade = null,Object? area = null,Object? medium = freezed,Object? title = null,Object? description = null,Object? questions = freezed,Object? pedagogies = freezed,Object? goals = null,Object? competencies = null,Object? rubric = null,}) {
  return _then(_Activity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,questions: freezed == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>?,pedagogies: freezed == pedagogies ? _self._pedagogies : pedagogies // ignore: cast_nullable_to_non_nullable
as List<String>?,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<String>,competencies: null == competencies ? _self._competencies : competencies // ignore: cast_nullable_to_non_nullable
as List<String>,rubric: null == rubric ? _self._rubric : rubric // ignore: cast_nullable_to_non_nullable
as Map<RubricAbility, Map<RubricLevel, String>>,
  ));
}


}

// dart format on
