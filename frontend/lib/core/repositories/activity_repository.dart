import 'package:ai_school/core/models/activity.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'activity_repository.g.dart';

@RestApi()
abstract class ActivityRepository {
  factory ActivityRepository(Dio dio, {String baseUrl}) = _ActivityRepository;

  @POST('/activities')
  Future<Activity> createActivity(@Body() Activity body);

  @PATCH('/activities/{id}')
  Future<Activity> updateActivity(
    @Path('id') String id,
    @Body() Activity body,
  );

  @DELETE('/activities/{id}')
  Future<void> deleteActivity(@Path('id') String id);

  @GET('/activities')
  Future<List<Activity>> listActivities({
    @Query('grade') String? grade,
    @Query('area') String? area,
    @Query('medium') String? medium,
    @Query('schoolId') String? schoolId,
  });
}

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  final dio = ref.read(clientProvider);
  return ActivityRepository(dio);
});
