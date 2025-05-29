import 'package:ai_school/core/models/school.dart';
import 'package:ai_school/core/repositories/school_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'school_provider.g.dart';

@Riverpod(keepAlive: true)
class YourSchool extends _$YourSchool {
  @override
  FutureOr<School> build() {
    final schoolId = ref.watch(sessionProvider.select((v) => v?.schoolId));

    if (schoolId == null) {
      return Future.error('School not found');
    }

    return ref.read(schoolRepositoryProvider).getSchoolById(schoolId);
  }

  void sync(School data){
    state = AsyncData(data);
  }
}
