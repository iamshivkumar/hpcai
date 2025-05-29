import 'package:ai_school/core/models/user_session.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final sessionProvider = Provider<UserSession?>(
  (ref) {
    return ref.read(cacheProvider).currentSession;
  },
);