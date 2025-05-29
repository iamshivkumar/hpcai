// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentsHash() => r'e7d3c56bd5644b088666fcd411209bcd050f6d15';

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

abstract class _$Students extends BuildlessAsyncNotifier<List<Student>> {
  late final String classId;

  FutureOr<List<Student>> build(String classId);
}

/// See also [Students].
@ProviderFor(Students)
const studentsProvider = StudentsFamily();

/// See also [Students].
class StudentsFamily extends Family<AsyncValue<List<Student>>> {
  /// See also [Students].
  const StudentsFamily();

  /// See also [Students].
  StudentsProvider call(String classId) {
    return StudentsProvider(classId);
  }

  @override
  StudentsProvider getProviderOverride(covariant StudentsProvider provider) {
    return call(provider.classId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentsProvider';
}

/// See also [Students].
class StudentsProvider
    extends AsyncNotifierProviderImpl<Students, List<Student>> {
  /// See also [Students].
  StudentsProvider(String classId)
    : this._internal(
        () => Students()..classId = classId,
        from: studentsProvider,
        name: r'studentsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$studentsHash,
        dependencies: StudentsFamily._dependencies,
        allTransitiveDependencies: StudentsFamily._allTransitiveDependencies,
        classId: classId,
      );

  StudentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classId,
  }) : super.internal();

  final String classId;

  @override
  FutureOr<List<Student>> runNotifierBuild(covariant Students notifier) {
    return notifier.build(classId);
  }

  @override
  Override overrideWith(Students Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentsProvider._internal(
        () => create()..classId = classId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classId: classId,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Students, List<Student>> createElement() {
    return _StudentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentsProvider && other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StudentsRef on AsyncNotifierProviderRef<List<Student>> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _StudentsProviderElement
    extends AsyncNotifierProviderElement<Students, List<Student>>
    with StudentsRef {
  _StudentsProviderElement(super.provider);

  @override
  String get classId => (origin as StudentsProvider).classId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
