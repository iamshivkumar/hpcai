import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.freezed.dart';
part 'class.g.dart';

@freezed
abstract class ClassArea with _$ClassArea {
  const factory ClassArea({required Area area, required String medium}) =
      _ClassArea;

  factory ClassArea.fromJson(Map<String, dynamic> json) =>
      _$ClassAreaFromJson(json);
}

@freezed
abstract class Class with _$Class {
  const factory Class({
    @JsonKey(includeToJson: false,name: '_id') 

    required String id,
    required String schoolId,
    String? teacherId,
    @GradeConverter()
    required Grade grade,
    String? section,
    required String year,
    required List<ClassArea> areas,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  Map<String, dynamic> toJson() => _$ClassToJson(this as _Class);
}

extension ClassX on Class {
  String get label => [grade.label, section].where((e) => e != null).join(' ');
}
