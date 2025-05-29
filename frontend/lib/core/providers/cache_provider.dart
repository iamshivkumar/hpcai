import 'dart:convert';

import 'package:ai_school/core/models/user_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final cacheProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());

extension SharedPreferencesExtension on SharedPreferences {
  UserSession? get currentSession {
    final session = getString('session');
    if (session == null) return null;
    return UserSession.fromJson(jsonDecode(session));
  }

  Future<bool> setSession(UserSession? session) {
    if (session == null) {
      return remove('session');
    } else {
      return setString('session', jsonEncode(session.toJson()));
    }
  }
}
