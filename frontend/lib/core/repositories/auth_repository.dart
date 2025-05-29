import 'package:ai_school/core/models/user_session.dart';
import 'package:ai_school/core/providers/client_provider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final dio = ref.read(clientProvider);
  return AuthRepository(dio);
});

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;


  @POST('/auth/send-otp')
  Future<String> sendOtp(
    @Field() String phone,
  );

  @POST('/auth/verify-otp')
  Future<UserSession> verifyOtp(
    @Field() String otp,
    @Field() String requestId,
  );



}
