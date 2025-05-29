import 'package:ai_school/core/enums/area.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    @JsonKey(includeToJson: false, name: '_id') required String id,
    required String classId,
    required String schoolId,
    required String name,
    String? image,
    required int rollNo,
    Map<Area, Map<String, bool>>? activities,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this as _Student);
}
