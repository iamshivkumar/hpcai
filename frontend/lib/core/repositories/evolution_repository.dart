import 'package:ai_school/core/models/evolution.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'evolution_repository.g.dart';

@RestApi()
abstract class EvolutionRepository {
  factory EvolutionRepository(Dio dio, {String baseUrl}) = _EvolutionRepository;

  @POST('/evolutions')
  Future<Evolution> createEvolution(@Body() Evolution body);

  @PATCH('/evolutions/{id}')
  Future<Evolution> updateEvolution(
    @Path('id') String id,
    @Body() Evolution body,
  );

  @DELETE('/evolutions/{id}')
  Future<void> deleteEvolution(@Path('id') String id);

  @GET('/evolutions/{id}')
  Future<Evolution> getEvolutionById(@Path('id') String id);

  @GET('/evolutions')
  Future<List<Evolution>> listEvolutions({
    @Query('schoolId') String? schoolId,
    @Query('classId') String? classId,
    @Query('assessmentId') String? assessmentId,
    @Query('studentId') String? studentId,
  });
}

final evolutionRepositoryProvider = Provider<EvolutionRepository>((ref) {
  final dio = ref.read(clientProvider);
  return EvolutionRepository(dio);
});
