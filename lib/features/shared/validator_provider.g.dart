// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$validateModeControllerHash() =>
    r'ff20bf45b272d8d1e5adcb1ccd5b1e0302f564c9';

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

abstract class _$ValidateModeController
    extends BuildlessAutoDisposeNotifier<AutovalidateMode> {
  late final int id;

  AutovalidateMode build({required int id});
}

/// See also [ValidateModeController].
@ProviderFor(ValidateModeController)
const validateModeControllerProvider = ValidateModeControllerFamily();

/// See also [ValidateModeController].
class ValidateModeControllerFamily extends Family<AutovalidateMode> {
  /// See also [ValidateModeController].
  const ValidateModeControllerFamily();

  /// See also [ValidateModeController].
  ValidateModeControllerProvider call({required int id}) {
    return ValidateModeControllerProvider(id: id);
  }

  @override
  ValidateModeControllerProvider getProviderOverride(
    covariant ValidateModeControllerProvider provider,
  ) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'validateModeControllerProvider';
}

/// See also [ValidateModeController].
class ValidateModeControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ValidateModeController,
          AutovalidateMode
        > {
  /// See also [ValidateModeController].
  ValidateModeControllerProvider({required int id})
    : this._internal(
        () => ValidateModeController()..id = id,
        from: validateModeControllerProvider,
        name: r'validateModeControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$validateModeControllerHash,
        dependencies: ValidateModeControllerFamily._dependencies,
        allTransitiveDependencies:
            ValidateModeControllerFamily._allTransitiveDependencies,
        id: id,
      );

  ValidateModeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  AutovalidateMode runNotifierBuild(covariant ValidateModeController notifier) {
    return notifier.build(id: id);
  }

  @override
  Override overrideWith(ValidateModeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ValidateModeControllerProvider._internal(
        () => create()..id = id,
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
  AutoDisposeNotifierProviderElement<ValidateModeController, AutovalidateMode>
  createElement() {
    return _ValidateModeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateModeControllerProvider && other.id == id;
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
mixin ValidateModeControllerRef
    on AutoDisposeNotifierProviderRef<AutovalidateMode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ValidateModeControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ValidateModeController,
          AutovalidateMode
        >
    with ValidateModeControllerRef {
  _ValidateModeControllerProviderElement(super.provider);

  @override
  int get id => (origin as ValidateModeControllerProvider).id;
}

String _$passControllerHash() => r'625cf9ae6645eca7522904a8a455203f0eb68f58';

abstract class _$PassController extends BuildlessAutoDisposeNotifier<bool> {
  late final int id;

  bool build({required int id});
}

/// See also [PassController].
@ProviderFor(PassController)
const passControllerProvider = PassControllerFamily();

/// See also [PassController].
class PassControllerFamily extends Family<bool> {
  /// See also [PassController].
  const PassControllerFamily();

  /// See also [PassController].
  PassControllerProvider call({required int id}) {
    return PassControllerProvider(id: id);
  }

  @override
  PassControllerProvider getProviderOverride(
    covariant PassControllerProvider provider,
  ) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'passControllerProvider';
}

/// See also [PassController].
class PassControllerProvider
    extends AutoDisposeNotifierProviderImpl<PassController, bool> {
  /// See also [PassController].
  PassControllerProvider({required int id})
    : this._internal(
        () => PassController()..id = id,
        from: passControllerProvider,
        name: r'passControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$passControllerHash,
        dependencies: PassControllerFamily._dependencies,
        allTransitiveDependencies:
            PassControllerFamily._allTransitiveDependencies,
        id: id,
      );

  PassControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  bool runNotifierBuild(covariant PassController notifier) {
    return notifier.build(id: id);
  }

  @override
  Override overrideWith(PassController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PassControllerProvider._internal(
        () => create()..id = id,
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
  AutoDisposeNotifierProviderElement<PassController, bool> createElement() {
    return _PassControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PassControllerProvider && other.id == id;
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
mixin PassControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PassControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PassController, bool>
    with PassControllerRef {
  _PassControllerProviderElement(super.provider);

  @override
  int get id => (origin as PassControllerProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
