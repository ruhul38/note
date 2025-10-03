// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(noteRepo)
const noteRepoProvider = NoteRepoProvider._();

final class NoteRepoProvider
    extends
        $FunctionalProvider<AsyncValue<NoteRepo>, NoteRepo, FutureOr<NoteRepo>>
    with $FutureModifier<NoteRepo>, $FutureProvider<NoteRepo> {
  const NoteRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteRepoHash();

  @$internal
  @override
  $FutureProviderElement<NoteRepo> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<NoteRepo> create(Ref ref) {
    return noteRepo(ref);
  }
}

String _$noteRepoHash() => r'e4cd6869ed49dfa99e10f2b46a877c4384b94c0f';
