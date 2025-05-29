import 'package:ai_school/core/enums/flex_form_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flex_form.freezed.dart';
part 'flex_form.g.dart';

/// feedback, registration, research, quiz

@freezed
abstract class FlexForm with _$FlexForm {
  factory FlexForm({
    required String id,
    required String key,
    @Default(false) bool system,

    /// test, assesssment, info
    required FlexFormType type,
    String? schoolId,
    String? classId,
    String? subjectId,
    String? groupId,
    List<String>? studentIds,
    required String title,
    String? description,
    String? image,
    String? icon,
    String? cover,

    /// minutes
    int? duration,

    @Default([]) List<FlexFormField> fields,

    required String status,
  }) = _FlexForm;

  factory FlexForm.fromJson(Map<String, dynamic> json) =>
      _$FlexFormFromJson(json);
}

@freezed
abstract class FlexFormField with _$FlexFormField {
  factory FlexFormField({
    // number, phone, email, text, choice, level*, rubric, date, datetime, time, currency(rupee), file, link, true-false,
    required String type,
    required String key,

    bool? required,

    String? title,
    String? titlePrefix,
    String? titleSuffix,
    String? image,
    String? description,
    String? note,

    /// common
    int? length,
    String? regex,
    String? hintText,
    String? helperText,
    String? prefix,
    String? suffix,

    /// for text, choice
    bool? multiple,

    /// for text
    bool? long,

    /// for text-multiple, choice-multiple,
    int? limit,

    /// suggestion related
    ///

    /// shortAnswer
    String? maskText,

    /// test
    int? points,

    /// points

    /// data
    int? outOf,

    /// date, time
    String? format,

    /// number
    int? max,
    int? min,

    /// for text
    int? minLines,
    int? maxLines,

    // png, mp4, pdf
    List<String>? fileTypes,

    /// choices
    List<String>? choices,
    String? choiceSource,

    /// choice-!multiple
    bool? dropdown,

    Map<String, String>? rubric,
    dynamic default$,
  }) = _FlexFormField;

  factory FlexFormField.fromJson(Map<String, dynamic> json) =>
      _$FlexFormFieldFromJson(json);
}
