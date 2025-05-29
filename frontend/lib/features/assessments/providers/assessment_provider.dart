


import 'package:ai_school/core/models/assessment.dart';
import 'package:ai_school/core/repositories/assessment_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assessment_provider.g.dart';

@riverpod
FutureOr<Assessment> assessmentById(Ref ref, String id) {
  return ref.read(assessmentRepositoryProvider).getAssessmentById(id);
}