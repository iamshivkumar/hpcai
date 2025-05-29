import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment.g.dart';
part 'assessment.freezed.dart';

enum AssessmentElementType { likeart, quiz, grid, image }

@freezed
abstract class AssessmentElement with _$AssessmentElement {
  factory AssessmentElement({
    required int index,
    String? instruction,
    required AssessmentElementType type, //likeart, quiz, grid,
    dynamic value,
  }) = _AssessmentElement;

  factory AssessmentElement.fromJson(Map<String, dynamic> json) =>
      _$AssessmentElementFromJson(json);
}

@freezed
abstract class AssessmentSection with _$AssessmentSection {
  factory AssessmentSection({
    required String key,
    required int index,
    String? name,
    @Default([]) List<AssessmentElement> elements,
  }) = _AssessmentSection;

  factory AssessmentSection.fromJson(Map<String, dynamic> json) =>
      _$AssessmentSectionFromJson(json);
}

enum AssessmentType { activity, peer, parent, about }

@freezed
abstract class Assessment with _$Assessment {
  factory Assessment({
    @JsonKey(includeToJson: false, name: '_id') required String id,
    required String schoolId,
    required String classId,
    required AssessmentType type,
    required String name,
    String? activityId,
    @JsonKey(includeToJson: false)
    Activity? activity,
    String? groupId,
    String? studentId,
    Area? area,
    String? medium,
    String? term,
    @JsonKey(includeToJson: false)
    @Default([])
    List<AssessmentSection> sections,
  }) = _Assessment;

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssessmentToJson(this as _Assessment);
}

@freezed
abstract class LikeartItem with _$LikeartItem {
  factory LikeartItem({
    required int index,
    required String key,
    required String value,
  }) = _LikeartItem;

  factory LikeartItem.fromJson(Map<String, dynamic> json) =>
      _$LikeartItemFromJson(json);
}

//     index: 0,
//     key: 'notes',
//     question: 'Observational Notes',
//     type: "long-answer", "short-answer", , "multiple-short-answers", "choice", "multiple-choice",
// options: {
//     index: 0,
//     value: "Books and Magazines",
//     key: "books-magazines",
// },

enum QuizItemType {
  @JsonValue('long-answer')
  longAnswer,
  @JsonValue("short-answer")
  shortAnswer,
  @JsonValue("true-false")
  trueFalse,
  @JsonValue("multiple-short-answers")
  multipleShortAnswers,
  @JsonValue("choice")
  choice,
  @JsonValue("multiple-choice")
  multipleChoice,
  @JsonValue('none')
  none,
}

@freezed
abstract class QuizItem with _$QuizItem {
  factory QuizItem({
    required int index,
    required String key,
    String? question,
    @JsonKey(unknownEnumValue: QuizItemType.none) required QuizItemType type,
  }) = _QuizItem;

  factory QuizItem.fromJson(Map<String, dynamic> json) =>
      _$QuizItemFromJson(json);
}



// import 'dart:math';

// String generateSixCharId() {
//   const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
//   final random = Random();
//   return String.fromCharCodes(
//     Iterable.generate(
//       6,
//       (_) => chars.codeUnitAt(random.nextInt(chars.length)),
//     ),
//   );
// }


