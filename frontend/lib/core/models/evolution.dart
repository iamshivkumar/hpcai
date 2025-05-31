
import 'package:freezed_annotation/freezed_annotation.dart';


part 'evolution.g.dart';
part 'evolution.freezed.dart';

@freezed
abstract class Evolution with _$Evolution {
  factory Evolution({
    @JsonKey(includeToJson: false, name: '_id') required String id,
    required String schoolId,
    required String classId,
    required String assessmentId,
    required String studentId,
    @Default({}) Map<String,dynamic> data,
  }) = _Evolution;

  factory Evolution.fromJson(Map<String, dynamic> json) =>
      _$EvolutionFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionToJson(this as _Evolution);
}