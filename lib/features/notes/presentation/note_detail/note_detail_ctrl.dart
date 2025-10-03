// lib/features/notes/presentation/note_detail/note_detail_ctrl.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/note_repo.dart';
import '../../domain/note.dart';
import '../note_list/note_list_ctrl.dart';
part 'note_detail_ctrl.g.dart';

@riverpod
class NoteDetailCtrl extends _$NoteDetailCtrl {
  @override
  Future<Note?> build(int? id) async {
    if (id == null || id < 0) return null;
    final repo = await ref.watch(noteRepoProvider.future); // ← get repo
    return repo.fetchById(id); // ← now it exists
  }

  Future<void> save(String title, String content) async {
    final repo = await ref.read(noteRepoProvider.future); // same here
    final now = DateTime.now();
    final note = state.value;
    if (note == null) {
      await repo.add(
        Note(title: title, content: content, created: now, updated: now),
      );
    } else {
      await repo.update(
        note.copyWith(title: title, content: content, updated: now),
      );
    }
    ref.invalidate(notesProvider); // refresh list
  }
}
