import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/core/repositories/student_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'students_provider.g.dart';

@Riverpod(keepAlive: true)
class Students extends _$Students {
  @override
  FutureOr<List<Student>> build(String classId) {
    return ref.read(studentRepositoryProvider).listStudentsByClass(classId);
  }

  void sync(Student data) {
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
