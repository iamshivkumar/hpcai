// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupsHash() => r'24b135a7ae068d23b6cd23a678235ff3c6b40620';

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

abstract class _$Groups extends BuildlessAsyncNotifier<List<Group>> {
  late final String classId;

  FutureOr<List<Group>> build(String classId);
}

/// See also [Groups].
@ProviderFor(Groups)
const groupsProvider = GroupsFamily();

/// See also [Groups].
class GroupsFamily extends Family<AsyncValue<List<Group>>> {
  /// See also [Groups].
  const GroupsFamily();

  /// See also [Groups].
  GroupsProvider call(String classId) {
    return GroupsProvider(classId);
  }

  @override
  GroupsProvider getProviderOverride(covariant GroupsProvider provider) {
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
  String? get name => r'groupsProvider';
}

/// See also [Groups].
class GroupsProvider extends AsyncNotifierProviderImpl<Groups, List<Group>> {
  /// See also [Groups].
  GroupsProvider(String classId)
    : this._internal(
        () => Groups()..classId = classId,
        from: groupsProvider,
        name: r'groupsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$groupsHash,
        dependencies: GroupsFamily._dependencies,
        allTransitiveDependencies: GroupsFamily._allTransitiveDependencies,
        classId: classId,
      );

  GroupsProvider._internal(
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
  FutureOr<List<Group>> runNotifierBuild(covariant Groups notifier) {
    return notifier.build(classId);
  }

  @override
  Override overrideWith(Groups Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupsProvider._internal(
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
  AsyncNotifierProviderElement<Groups, List<Group>> createElement() {
    return _GroupsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupsProvider && other.classId == classId;
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
mixin GroupsRef on AsyncNotifierProviderRef<List<Group>> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _GroupsProviderElement
    extends AsyncNotifierProviderElement<Groups, List<Group>>
    with GroupsRef {
  _GroupsProviderElement(super.provider);

  @override
  String get classId => (origin as GroupsProvider).classId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
