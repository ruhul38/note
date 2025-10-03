// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Single Sembast database instance for the whole app.

@ProviderFor(sembastDB)
const sembastDBProvider = SembastDBProvider._();

/// Single Sembast database instance for the whole app.

final class SembastDBProvider
    extends
        $FunctionalProvider<AsyncValue<Database>, Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  /// Single Sembast database instance for the whole app.
  const SembastDBProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sembastDBProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sembastDBHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return sembastDB(ref);
  }
}

String _$sembastDBHash() => r'bf5468a55e391f002aaaf94694c8c9a1f9a23d6e';
