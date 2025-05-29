import 'package:ai_school/core/models/teacher.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'teacher_repository.g.dart';

@RestApi()
abstract class TeacherRepository {
  factory TeacherRepository(Dio dio, {String baseUrl}) = _TeacherRepository;

  @POST('/teachers')
  Future<Teacher> createTeacher(@Body() Teacher body);

  @PATCH('/teachers/{id}')
  Future<Teacher> updateTeacher(
    @Path('id') String id,
    @Body() Teacher body,
  );

  @DELETE('/teachers/{id}')
  Future<void> deleteTeacher(@Path('id') String id);

  @GET('/teachers/school/{schoolId}')
  Future<List<Teacher>> listTeachersBySchool(@Path('schoolId') String schoolId);
}

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  final dio = ref.read(clientProvider);
  return TeacherRepository(dio);
});
