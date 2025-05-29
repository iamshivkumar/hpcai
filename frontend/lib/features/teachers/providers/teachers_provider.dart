import 'package:ai_school/core/models/teacher.dart';
import 'package:ai_school/core/repositories/teacher_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teachers_provider.g.dart';

@Riverpod(keepAlive: true)
class Teachers extends _$Teachers {
  @override
  FutureOr<List<Teacher>> build() {
    final schoolId = ref.watch(sessionProvider.select((v) => v?.schoolId));

    if (schoolId == null) {
      return Future.error('School not found');
    }

    return ref.read(teacherRepositoryProvider).listTeachersBySchool(schoolId);
  }

  void sync(Teacher data) {
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
