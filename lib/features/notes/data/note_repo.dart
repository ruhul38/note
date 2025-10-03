import 'package:sembast/sembast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/providers.dart';
import '../domain/note.dart';
import 'note_model.dart';

part 'note_repo.g.dart';

@riverpod
Future<NoteRepo> noteRepo(Ref ref) async {
  final db = await ref.watch(sembastDBProvider.future); // ← unwrap Future
  return NoteRepo(db);
}

class NoteRepo {
  final Database _db;
  final _dao = NoteDao();
  NoteRepo(this._db);

  Future<List<Note>> fetchAll() => _dao.getAll(_db);
  Future<Note?> fetchById(int id) => _dao.getById(_db, id);
  Future<int> add(Note note) => _dao.insert(_db, note);
  Future<void> update(Note note) => _dao.update(_db, note);
  Future<void> delete(int id) => _dao.delete(_db, id);
}
