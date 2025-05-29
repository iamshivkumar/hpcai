// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assessmentsHash() => r'600684d213836defae1b7f9d05170f0e8622bbf8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Assessments
    extends BuildlessAutoDisposeAsyncNotifier<List<Assessment>> {
  late final String classId;
  late final AssessmentType type;
  late final Area? area;
  late final String? medium;
  late final String? term;

  FutureOr<List<Assessment>> build({
    required String classId,
    required AssessmentType type,
    Area? area,
    String? medium,
    String? term,
  });
}

/// See also [Assessments].
@ProviderFor(Assessments)
const assessmentsProvider = AssessmentsFamily();

/// See also [Assessments].
class AssessmentsFamily extends Family<AsyncValue<List<Assessment>>> {
  /// See also [Assessments].
  const AssessmentsFamily();

  /// See also [Assessments].
  AssessmentsProvider call({
    required String classId,
    required AssessmentType type,
    Area? area,
    String? medium,
    String? term,
  }) {
    return AssessmentsProvider(
      classId: classId,
      type: type,
      area: area,
      medium: medium,
      term: term,
    );
  }

  @override
  AssessmentsProvider getProviderOverride(
    covariant AssessmentsProvider provider,
  ) {
    return call(
      classId: provider.classId,
      type: provider.type,
      area: provider.area,
      medium: provider.medium,
      term: provider.term,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'assessmentsProvider';
}

/// See also [Assessments].
class AssessmentsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<Assessments, List<Assessment>> {
  /// See also [Assessments].
  AssessmentsProvider({
    required String classId,
    required AssessmentType type,
    Area? area,
    String? medium,
    String? term,
  }) : this._internal(
         () =>
             Assessments()
               ..classId = classId
               ..type = type
               ..area = area
               ..medium = medium
               ..term = term,
         from: assessmentsProvider,
         name: r'assessmentsProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$assessmentsHash,
         dependencies: AssessmentsFamily._dependencies,
         allTransitiveDependencies:
             AssessmentsFamily._allTransitiveDependencies,
         classId: classId,
         type: type,
         area: area,
         medium: medium,
         term: term,
       );

  AssessmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classId,
    required this.type,
    required this.area,
    required this.medium,
    required this.term,
  }) : super.internal();

  final String classId;
  final AssessmentType type;
  final Area? area;
  final String? medium;
  final String? term;

  @override
  FutureOr<List<Assessment>> runNotifierBuild(covariant Assessments notifier) {
    return notifier.build(
      classId: classId,
      type: type,
      area: area,
      medium: medium,
      term: term,
    );
  }

  @override
  Override overrideWith(Assessments Function() create) {
    return ProviderOverride(
      origin: this,
      override: AssessmentsProvider._internal(
        () =>
            create()
              ..classId = classId
              ..type = type
              ..area = area
              ..medium = medium
              ..term = term,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classId: classId,
        type: type,
        area: area,
        medium: medium,
        term: term,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Assessments, List<Assessment>>
  createElement() {
    return _AssessmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssessmentsProvider &&
        other.classId == classId &&
        other.type == type &&
        other.area == area &&
        other.medium == medium &&
        other.term == term;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, area.hashCode);
    hash = _SystemHash.combine(hash, medium.hashCode);
    hash = _SystemHash.combine(hash, term.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AssessmentsRef on AutoDisposeAsyncNotifierProviderRef<List<Assessment>> {
  /// The parameter `classId` of this provider.
  String get classId;

  /// The parameter `type` of this provider.
  AssessmentType get type;

  /// The parameter `area` of this provider.
  Area? get area;

  /// The parameter `medium` of this provider.
  String? get medium;

  /// The parameter `term` of this provider.
  String? get term;
}

class _AssessmentsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<Assessments, List<Assessment>>
    with AssessmentsRef {
  _AssessmentsProviderElement(super.provider);

  @override
  String get classId => (origin as AssessmentsProvider).classId;
  @override
  AssessmentType get type => (origin as AssessmentsProvider).type;
  @override
  Area? get area => (origin as AssessmentsProvider).area;
  @override
  String? get medium => (origin as AssessmentsProvider).medium;
  @override
  String? get term => (origin as AssessmentsProvider).term;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
