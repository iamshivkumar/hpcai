import 'package:ai_school/core/enums/area.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
abstract class Group with _$Group {
  const factory Group({
    @JsonKey(includeToJson: false,name: '_id') 
    required String id,
    required String classId,
    required String schoolId,
    required String name,
    Area? area,
    required List<String> studentIds,
    @Default(false) bool primary,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this as _Group);
}
