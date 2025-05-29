// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activitiesHash() => r'764ebccc2050f4bc25ada32935f3b86e6fe00147';

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

abstract class _$Activities extends BuildlessAsyncNotifier<List<Activity>> {
  late final Grade grade;
  late final Area area;

  FutureOr<List<Activity>> build(Grade grade, Area area);
}

/// See also [Activities].
@ProviderFor(Activities)
const activitiesProvider = ActivitiesFamily();

/// See also [Activities].
class ActivitiesFamily extends Family<AsyncValue<List<Activity>>> {
  /// See also [Activities].
  const ActivitiesFamily();

  /// See also [Activities].
  ActivitiesProvider call(Grade grade, Area area) {
    return ActivitiesProvider(grade, area);
  }

  @override
  ActivitiesProvider getProviderOverride(
    covariant ActivitiesProvider provider,
  ) {
    return call(provider.grade, provider.area);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'activitiesProvider';
}

/// See also [Activities].
class ActivitiesProvider
    extends AsyncNotifierProviderImpl<Activities, List<Activity>> {
  /// See also [Activities].
  ActivitiesProvider(Grade grade, Area area)
    : this._internal(
        () =>
            Activities()
              ..grade = grade
              ..area = area,
        from: activitiesProvider,
        name: r'activitiesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$activitiesHash,
        dependencies: ActivitiesFamily._dependencies,
        allTransitiveDependencies: ActivitiesFamily._allTransitiveDependencies,
        grade: grade,
        area: area,
      );

  ActivitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.grade,
    required this.area,
  }) : super.internal();

  final Grade grade;
  final Area area;

  @override
  FutureOr<List<Activity>> runNotifierBuild(covariant Activities notifier) {
    return notifier.build(grade, area);
  }

  @override
  Override overrideWith(Activities Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActivitiesProvider._internal(
        () =>
            create()
              ..grade = grade
              ..area = area,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        grade: grade,
        area: area,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Activities, List<Activity>> createElement() {
    return _ActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivitiesProvider &&
        other.grade == grade &&
        other.area == area;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, grade.hashCode);
    hash = _SystemHash.combine(hash, area.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActivitiesRef on AsyncNotifierProviderRef<List<Activity>> {
  /// The parameter `grade` of this provider.
  Grade get grade;

  /// The parameter `area` of this provider.
  Area get area;
}

class _ActivitiesProviderElement
    extends AsyncNotifierProviderElement<Activities, List<Activity>>
    with ActivitiesRef {
  _ActivitiesProviderElement(super.provider);

  @override
  Grade get grade => (origin as ActivitiesProvider).grade;
  @override
  Area get area => (origin as ActivitiesProvider).area;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
