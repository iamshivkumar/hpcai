import 'package:ai_school/core/models/class.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'class_repository.g.dart';

@RestApi()
abstract class ClassRepository {
  factory ClassRepository(Dio dio, {String baseUrl}) = _ClassRepository;

  @POST('/classes')
  Future<Class> createClass(@Body() Class body);

  @PATCH('/classes/{id}')
  Future<Class> updateClass(
    @Path('id') String id,
    @Body() Class body,
  );

  @DELETE('/classes/{id}')
  Future<void> deleteClass(@Path('id') String id);

  @GET('/classes/school/{schoolId}')
  Future<List<Class>> listClassesBySchool(@Path('schoolId') String schoolId);
}

final classRepositoryProvider = Provider<ClassRepository>((ref) {
  final dio = ref.read(clientProvider);
  return ClassRepository(dio);
});
