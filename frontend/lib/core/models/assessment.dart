import 'package:ai_school/core/enums/area.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment.g.dart';
part 'assessment.freezed.dart';


enum AssessmentElementType {likeart, quiz, grid}

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


    Map<String, dynamic> toJson() => _$AssessmentElementToJson(this as _AssessmentElement);

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
  Map<String, dynamic> toJson() => _$AssessmentSectionToJson(this as _AssessmentSection);
}

enum AssessmentType {activity, peer, parent, about}

@freezed
abstract class Assessment with _$Assessment {
  factory Assessment({
    required String schoolId,
    required String classId,
    required AssessmentType type,
    Area? area,
    String? medium,
    String? term,
    @Default([]) List<AssessmentSection> sections,
  }) = _Assessment;

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssessmentToJson(this as _Assessment);
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

// // Example usage
// void main() {
//   const statement = "My friend can talk about how he/she feels, e.g., happy, confident, upset, or angry.";
//   final uniqueId = generateSixCharId();
//   print('Statement: $statement, ID: $uniqueId');
// }