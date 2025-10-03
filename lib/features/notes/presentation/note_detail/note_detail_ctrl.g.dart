// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_detail_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoteDetailCtrl)
const noteDetailCtrlProvider = NoteDetailCtrlFamily._();

final class NoteDetailCtrlProvider
    extends $AsyncNotifierProvider<NoteDetailCtrl, Note?> {
  const NoteDetailCtrlProvider._({
    required NoteDetailCtrlFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'noteDetailCtrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteDetailCtrlHash();

  @override
  String toString() {
    return r'noteDetailCtrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NoteDetailCtrl create() => NoteDetailCtrl();

  @override
  bool operator ==(Object other) {
    return other is NoteDetailCtrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteDetailCtrlHash() => r'61b768c776705de980c4e3455d1eb0fbe776a9da';

final class NoteDetailCtrlFamily extends $Family
    with
        $ClassFamilyOverride<
          NoteDetailCtrl,
          AsyncValue<Note?>,
          Note?,
          FutureOr<Note?>,
          int?
        > {
  const NoteDetailCtrlFamily._()
    : super(
        retry: null,
        name: r'noteDetailCtrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteDetailCtrlProvider call(int? id) =>
      NoteDetailCtrlProvider._(argument: id, from: this);

  @override
  String toString() => r'noteDetailCtrlProvider';
}

abstract class _$NoteDetailCtrl extends $AsyncNotifier<Note?> {
  late final _$args = ref.$arg as int?;
  int? get id => _$args;

  FutureOr<Note?> build(int? id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Note?>, Note?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Note?>, Note?>,
              AsyncValue<Note?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
