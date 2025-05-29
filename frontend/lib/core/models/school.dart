import 'package:freezed_annotation/freezed_annotation.dart';

part 'school.freezed.dart';
part 'school.g.dart';

@freezed
abstract class School with _$School {
  const factory School({
    @JsonKey(includeToJson: false,name: '_id') 
    required String id,
    required String name,
    String? logo,
    required String address,
    required String udise,
    @Default("CBSE") String board,
    required String ownerId,
  }) = _School;

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolToJson(this as _School);
}
