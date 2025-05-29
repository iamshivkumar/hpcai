import 'package:ai_school/core/models/attendance.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_school/core/providers/client_provider.dart';

part 'attendance_repository.g.dart';

@RestApi()
abstract class AttendanceRepository {
  factory AttendanceRepository(Dio dio, {String baseUrl}) = _AttendanceRepository;

  @POST('/attendances')
  Future<Attendance> writeAttendance(@Body() Attendance body);

  @DELETE('/attendances/{id}')
  Future<void> deleteAttendance(@Path('id') String id);

  @GET('/attendances')
  Future<List<Attendance>> listAttendance({
    @Query('classId') String? classId,
    @Query('studentId') String? studentId,
    @Query('date') String? date,
    @Query('startDate') String? startDate,
    @Query('endDate') String? endDate,
  });
}

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final dio = ref.read(clientProvider);
  return AttendanceRepository(dio);
});
