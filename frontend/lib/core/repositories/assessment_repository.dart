import 'package:ai_school/core/models/assessment.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'assessment_repository.g.dart';

@RestApi()
abstract class AssessmentRepository {
  factory AssessmentRepository(Dio dio, {String baseUrl}) =
      _AssessmentRepository;

  @POST('/assessments')
  Future<Assessment> generateAssessment(@Body() Map<String,dynamic> body);

  @PATCH('/assessments/{id}')
  Future<Assessment> updateAssessment(
    @Path('id') String id,
    @Body() Assessment body,
  );

  @DELETE('/assessments/{id}')
  Future<void> deleteAssessment(@Path('id') String id);

  @GET('/assessments')
  Future<List<Assessment>> listAssessments({
    @Query('schoolId') String? schoolId,
    @Query('classId') String? classId,
    @Query('area') String? area,
    @Query('medium') String? medium,
    @Query('term') String? term,
    @Query('type') String? type,
  });

  @GET('/assessments/{id}')
  Future<Assessment> getAssessmentById(@Path('id') String id);
}

final assessmentRepositoryProvider = Provider<AssessmentRepository>((ref) {
  final dio = ref.read(clientProvider);
  return AssessmentRepository(dio);
});
