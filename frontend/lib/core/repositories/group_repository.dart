import 'package:ai_school/core/models/group.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'group_repository.g.dart';

@RestApi()
abstract class GroupRepository {
  factory GroupRepository(Dio dio, {String baseUrl}) = _GroupRepository;

  @POST('/groups')
  Future<Group> createGroup(@Body() Group body);

  @PATCH('/groups/{id}')
  Future<Group> updateGroup(
    @Path('id') String id,
    @Body() Group body,
  );

  @DELETE('/groups/{id}')
  Future<void> deleteGroup(@Path('id') String id);

  @GET('/groups/class/{classId}')
  Future<List<Group>> listGroupsByClass(@Path('classId') String classId);
}

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  final dio = ref.read(clientProvider);
  return GroupRepository(dio);
});
