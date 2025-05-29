import 'package:ai_school/core/enums/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@freezed
abstract class UserSession with _$UserSession {
  factory UserSession({
    required String id,
    String? schoolId,
    required String name,
    required String phone,
    required UserRole role,
    required String token,
    required DateTime createdAt,
    required DateTime? updatedAt,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
