// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assessmentEvolutionHash() =>
    r'6d31c390adc15ca8864ba9ba2835251bc54a64ed';

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

abstract class _$AssessmentEvolution
    extends BuildlessAutoDisposeAsyncNotifier<Evolution?> {
  late final String assessmentId;
  late final String studentId;

  FutureOr<Evolution?> build({
    required String assessmentId,
    required String studentId,
  });
}

/// See also [AssessmentEvolution].
@ProviderFor(AssessmentEvolution)
const assessmentEvolutionProvider = AssessmentEvolutionFamily();

/// See also [AssessmentEvolution].
class AssessmentEvolutionFamily extends Family<AsyncValue<Evolution?>> {
  /// See also [AssessmentEvolution].
  const AssessmentEvolutionFamily();

  /// See also [AssessmentEvolution].
  AssessmentEvolutionProvider call({
    required String assessmentId,
    required String studentId,
  }) {
    return AssessmentEvolutionProvider(
      assessmentId: assessmentId,
      studentId: studentId,
    );
  }

  @override
  AssessmentEvolutionProvider getProviderOverride(
    covariant AssessmentEvolutionProvider provider,
  ) {
    return call(
      assessmentId: provider.assessmentId,
      studentId: provider.studentId,
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
  String? get name => r'assessmentEvolutionProvider';
}

/// See also [AssessmentEvolution].
class AssessmentEvolutionProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<AssessmentEvolution, Evolution?> {
  /// See also [AssessmentEvolution].
  AssessmentEvolutionProvider({
    required String assessmentId,
    required String studentId,
  }) : this._internal(
         () =>
             AssessmentEvolution()
               ..assessmentId = assessmentId
               ..studentId = studentId,
         from: assessmentEvolutionProvider,
         name: r'assessmentEvolutionProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$assessmentEvolutionHash,
         dependencies: AssessmentEvolutionFamily._dependencies,
         allTransitiveDependencies:
             AssessmentEvolutionFamily._allTransitiveDependencies,
         assessmentId: assessmentId,
         studentId: studentId,
       );

  AssessmentEvolutionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.assessmentId,
    required this.studentId,
  }) : super.internal();

  final String assessmentId;
  final String studentId;

  @override
  FutureOr<Evolution?> runNotifierBuild(
    covariant AssessmentEvolution notifier,
  ) {
    return notifier.build(assessmentId: assessmentId, studentId: studentId);
  }

  @override
  Override overrideWith(AssessmentEvolution Function() create) {
    return ProviderOverride(
      origin: this,
      override: AssessmentEvolutionProvider._internal(
        () =>
            create()
              ..assessmentId = assessmentId
              ..studentId = studentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        assessmentId: assessmentId,
        studentId: studentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AssessmentEvolution, Evolution?>
  createElement() {
    return _AssessmentEvolutionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssessmentEvolutionProvider &&
        other.assessmentId == assessmentId &&
        other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, assessmentId.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AssessmentEvolutionRef
    on AutoDisposeAsyncNotifierProviderRef<Evolution?> {
  /// The parameter `assessmentId` of this provider.
  String get assessmentId;

  /// The parameter `studentId` of this provider.
  String get studentId;
}

class _AssessmentEvolutionProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<AssessmentEvolution, Evolution?>
    with AssessmentEvolutionRef {
  _AssessmentEvolutionProviderElement(super.provider);

  @override
  String get assessmentId =>
      (origin as AssessmentEvolutionProvider).assessmentId;
  @override
  String get studentId => (origin as AssessmentEvolutionProvider).studentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
