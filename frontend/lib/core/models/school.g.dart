// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_School _$SchoolFromJson(Map<String, dynamic> json) => _School(
  id: json['_id'] as String,
  name: json['name'] as String,
  logo: json['logo'] as String?,
  address: json['address'] as String,
  udise: json['udise'] as String,
  board: json['board'] as String? ?? "CBSE",
  ownerId: json['ownerId'] as String,
);

Map<String, dynamic> _$SchoolToJson(_School instance) => <String, dynamic>{
  'name': instance.name,
  'logo': instance.logo,
  'address': instance.address,
  'udise': instance.udise,
  'board': instance.board,
  'ownerId': instance.ownerId,
};
