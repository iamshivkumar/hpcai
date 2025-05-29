import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

/// Enum to represent attendance status
enum AttendanceStatus {
  @JsonValue('P')
  present,
  @JsonValue('A')
  absent,
  @JsonValue('L')
  late,
  @JsonValue('H')
  holiday,
  @JsonValue('M')
  medical,
}

@freezed
abstract class Attendance with _$Attendance {
  const factory Attendance({
    @JsonKey(includeToJson: false, name: '_id') required String id,
    required String schoolId,
    required String classId,
    required String studentId,
    required String date, // Format: "YYYY-MM-DD"
    required DateTime datetime,
    required AttendanceStatus status,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this as _Attendance);
}
