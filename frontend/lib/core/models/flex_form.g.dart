// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlexForm _$FlexFormFromJson(Map<String, dynamic> json) => _FlexForm(
  id: json['id'] as String,
  key: json['key'] as String,
  system: json['system'] as bool? ?? false,
  type: $enumDecode(_$FlexFormTypeEnumMap, json['type']),
  schoolId: json['schoolId'] as String?,
  classId: json['classId'] as String?,
  subjectId: json['subjectId'] as String?,
  groupId: json['groupId'] as String?,
  studentIds:
      (json['studentIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  title: json['title'] as String,
  description: json['description'] as String?,
  image: json['image'] as String?,
  icon: json['icon'] as String?,
  cover: json['cover'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  fields:
      (json['fields'] as List<dynamic>?)
          ?.map((e) => FlexFormField.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  status: json['status'] as String,
);

Map<String, dynamic> _$FlexFormToJson(_FlexForm instance) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'system': instance.system,
  'type': _$FlexFormTypeEnumMap[instance.type]!,
  'schoolId': instance.schoolId,
  'classId': instance.classId,
  'subjectId': instance.subjectId,
  'groupId': instance.groupId,
  'studentIds': instance.studentIds,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'icon': instance.icon,
  'cover': instance.cover,
  'duration': instance.duration,
  'fields': instance.fields.map((e) => e.toJson()).toList(),
  'status': instance.status,
};

const _$FlexFormTypeEnumMap = {
  FlexFormType.info: 'info',
  FlexFormType.assessment: 'assessment',
  FlexFormType.test: 'test',
};

_FlexFormField _$FlexFormFieldFromJson(Map<String, dynamic> json) =>
    _FlexFormField(
      type: json['type'] as String,
      key: json['key'] as String,
      required: json['required'] as bool?,
      title: json['title'] as String?,
      titlePrefix: json['titlePrefix'] as String?,
      titleSuffix: json['titleSuffix'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      note: json['note'] as String?,
      length: (json['length'] as num?)?.toInt(),
      regex: json['regex'] as String?,
      hintText: json['hintText'] as String?,
      helperText: json['helperText'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      multiple: json['multiple'] as bool?,
      long: json['long'] as bool?,
      limit: (json['limit'] as num?)?.toInt(),
      maskText: json['maskText'] as String?,
      points: (json['points'] as num?)?.toInt(),
      outOf: (json['outOf'] as num?)?.toInt(),
      format: json['format'] as String?,
      max: (json['max'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      minLines: (json['minLines'] as num?)?.toInt(),
      maxLines: (json['maxLines'] as num?)?.toInt(),
      fileTypes:
          (json['fileTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      choiceSource: json['choiceSource'] as String?,
      dropdown: json['dropdown'] as bool?,
      rubric: (json['rubric'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      default$: json[r'default$'],
    );

Map<String, dynamic> _$FlexFormFieldToJson(_FlexFormField instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'required': instance.required,
      'title': instance.title,
      'titlePrefix': instance.titlePrefix,
      'titleSuffix': instance.titleSuffix,
      'image': instance.image,
      'description': instance.description,
      'note': instance.note,
      'length': instance.length,
      'regex': instance.regex,
      'hintText': instance.hintText,
      'helperText': instance.helperText,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'multiple': instance.multiple,
      'long': instance.long,
      'limit': instance.limit,
      'maskText': instance.maskText,
      'points': instance.points,
      'outOf': instance.outOf,
      'format': instance.format,
      'max': instance.max,
      'min': instance.min,
      'minLines': instance.minLines,
      'maxLines': instance.maxLines,
      'fileTypes': instance.fileTypes,
      'choices': instance.choices,
      'choiceSource': instance.choiceSource,
      'dropdown': instance.dropdown,
      'rubric': instance.rubric,
      r'default$': instance.default$,
    };
