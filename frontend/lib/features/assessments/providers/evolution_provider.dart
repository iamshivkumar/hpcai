import 'package:ai_school/core/models/evolution.dart';
import 'package:ai_school/core/repositories/evolution_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'evolution_provider.g.dart';

@riverpod
class AssessmentEvolution extends _$AssessmentEvolution {
  @override
  FutureOr<Evolution?> build({
    required String assessmentId,
    required String studentId,
  }) async{


    final res = await ref
        .read(evolutionRepositoryProvider)
        .listEvolutions(
          assessmentId: assessmentId,
          studentId: studentId
        );

    return res.firstOrNull;
  }
}
