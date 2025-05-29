import 'package:ai_school/core/models/student.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'student_repository.g.dart';

@RestApi()
abstract class StudentRepository {
  factory StudentRepository(Dio dio, {String baseUrl}) = _StudentRepository;

  @POST('/students')
  Future<Student> createStudent(@Body() Student body);

  @PATCH('/students/{id}')
  Future<Student> updateStudent(
    @Path('id') String id,
    @Body() Student body,
  );

  @DELETE('/students/{id}')
  Future<void> deleteStudent(@Path('id') String id);

  @GET('/students/class/{classId}')
  Future<List<Student>> listStudentsByClass(@Path('classId') String classId);
}

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final dio = ref.read(clientProvider);
  return StudentRepository(dio);
});
