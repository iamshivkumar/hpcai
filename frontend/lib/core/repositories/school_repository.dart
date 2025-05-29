import 'package:ai_school/core/models/school.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'school_repository.g.dart';

@RestApi()
abstract class SchoolRepository {
  factory SchoolRepository(Dio dio, {String baseUrl}) = _SchoolRepository;

  @POST('/schools')
  Future<School> createSchool(@Body() School school);

  @PATCH('/schools/{id}')
  Future<School> updateSchool(
    @Path('id') String id,
    @Body() School school,
  );

  @GET('/schools/{id}')
  Future<School> getSchoolById(@Path('id') String id);
}

final schoolRepositoryProvider = Provider<SchoolRepository>((ref) {
  final dio = ref.read(clientProvider);
  return SchoolRepository(dio);
});
