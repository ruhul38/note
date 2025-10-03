import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/note_repo.dart';
import '../../domain/note.dart';

part 'note_list_ctrl.g.dart';

@riverpod
Future<List<Note>> notes(Ref ref) async {
  final repo = await ref.watch(noteRepoProvider.future);
  return repo.fetchAll();
}
