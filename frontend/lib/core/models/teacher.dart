import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
abstract class Teacher with _$Teacher {
  const factory Teacher({
    @JsonKey(includeToJson: false,name: '_id') 
    required String id,
    required String schoolId,
    required String name,
    String? image,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);


      Map<String, dynamic> toJson() => _$TeacherToJson(this as _Teacher);

}
