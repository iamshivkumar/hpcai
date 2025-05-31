import 'dart:async';

import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/repositories/assessment_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assessments_provider.g.dart';

@riverpod
class Assessments extends _$Assessments {
  @override
  FutureOr<List<Assessment>> build({
    required String classId,
    required AssessmentType type,

    Area? area,
    String? medium,
    String? term,
  }) {
    final schoolId = ref.watch(sessionProvider.select((v) => v?.schoolId));

    if (schoolId == null) {
      return Future.error('School not found');
    }

    return ref
        .read(assessmentRepositoryProvider)
        .listAssessments(
          schoolId: schoolId,
          area: area?.name,
          classId: classId,
          type: type.name,
        );
  }

    void sync(Assessment data) {
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
