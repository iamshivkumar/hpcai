// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assessmentByIdHash() => r'55384ab9148907e440d80b165d5c4a538927693e';

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

/// See also [assessmentById].
@ProviderFor(assessmentById)
const assessmentByIdProvider = AssessmentByIdFamily();

/// See also [assessmentById].
class AssessmentByIdFamily extends Family<AsyncValue<Assessment>> {
  /// See also [assessmentById].
  const AssessmentByIdFamily();

  /// See also [assessmentById].
  AssessmentByIdProvider call(String id) {
    return AssessmentByIdProvider(id);
  }

  @override
  AssessmentByIdProvider getProviderOverride(
    covariant AssessmentByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'assessmentByIdProvider';
}

/// See also [assessmentById].
class AssessmentByIdProvider extends AutoDisposeFutureProvider<Assessment> {
  /// See also [assessmentById].
  AssessmentByIdProvider(String id)
    : this._internal(
        (ref) => assessmentById(ref as AssessmentByIdRef, id),
        from: assessmentByIdProvider,
        name: r'assessmentByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$assessmentByIdHash,
        dependencies: AssessmentByIdFamily._dependencies,
        allTransitiveDependencies:
            AssessmentByIdFamily._allTransitiveDependencies,
        id: id,
      );

  AssessmentByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Assessment> Function(AssessmentByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssessmentByIdProvider._internal(
        (ref) => create(ref as AssessmentByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Assessment> createElement() {
    return _AssessmentByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssessmentByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AssessmentByIdRef on AutoDisposeFutureProviderRef<Assessment> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AssessmentByIdProviderElement
    extends AutoDisposeFutureProviderElement<Assessment>
    with AssessmentByIdRef {
  _AssessmentByIdProviderElement(super.provider);

  @override
  String get id => (origin as AssessmentByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
