import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/repositories/class_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'classes_provider.g.dart';

@Riverpod(keepAlive: true)
class Classes extends _$Classes {
  @override
  FutureOr<List<Class>> build() {
    final schoolId = ref.watch(sessionProvider.select((v) => v?.schoolId));

    if (schoolId == null) {
      return Future.error('School not found');
    }

    return ref.read(classRepositoryProvider).listClassesBySchool(schoolId);
  }

  void sync(Class data) {
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
