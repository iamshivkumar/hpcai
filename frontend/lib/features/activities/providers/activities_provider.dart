

import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/enums/grade.dart';
import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/core/repositories/activity_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activities_provider.g.dart';

@Riverpod(keepAlive: true)
class Activities extends _$Activities {
  @override
  FutureOr<List<Activity>> build(Grade grade, Area area) {
        final schoolId = ref.watch(sessionProvider.select((v) => v?.schoolId));

    if (schoolId == null) {
      return Future.error('School not found');
    }
    return ref.read(activityRepositoryProvider).listActivities(
      area: area.name,
      grade: grade.value,
      schoolId: schoolId,
    );
  }

  void sync(Activity data) {
    if (state.value != null) {
      if (state.value!.any((e) => e.id == data.id)) {
        state = AsyncData([
          ...state.value!.map((e) => e.id == data.id ? data : e),
        ]);
      } else {
        state = AsyncData([...state.value!, data]);
      }
    }
  }

  void remove(String id) {
    if (state.value != null) {
      state = AsyncData(
        [...state.value!]..removeWhere((element) => element.id == id),
      );
    }
  }
}
