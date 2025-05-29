import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';
import 'package:ai_school/core/enums/rubric.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    @JsonKey(includeToJson: false, name: '_id') required String id,
    String? schoolId,

    @GradeConverter() required Grade grade,
    required Area area,
    String? medium,
    required String title,
    required String description,
    List<String>? questions,
    List<String>? pedagogies,
    @Default([]) List<String> goals,
    @Default([]) List<String> competencies,
    @Default({}) Map<RubricAbility, Map<RubricLevel, String>> rubric,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this as _Activity);
}

extension ActivityX on Activity {
  String get label => "$title (${area.label})";
}
