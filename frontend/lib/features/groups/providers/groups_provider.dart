import 'package:ai_school/core/models/group.dart';
import 'package:ai_school/core/repositories/group_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'groups_provider.g.dart';

@Riverpod(keepAlive: true)
class Groups extends _$Groups {
  @override
  FutureOr<List<Group>> build(String classId) {
    return ref.read(groupRepositoryProvider).listGroupsByClass(classId);
  }

  void sync(Group data) {
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
