import 'package:sembast/sembast.dart';

import '../domain/note.dart';

/// Plain Dart model → Map converter for Sembast.
class NoteDao {
  static const String storeName = 'notes';
  final StoreRef<int, Map<String, dynamic>> _store = intMapStoreFactory.store(
    storeName,
  );

  Future<List<Note>> getAll(Database db) async {
    final recs = await _store.find(
      db,
      finder: Finder(sortOrders: [SortOrder('updated', false)]),
    );
    return recs.map((s) => Note.fromMap(s.value, s.key)).toList();
  }

  Future<Note?> getById(Database db, int id) async {
    final rec = await _store.record(id).get(db);
    return rec == null ? null : Note.fromMap(rec, id);
  }

  Future<int> insert(Database db, Note note) async =>
      await _store.add(db, note.toMap());

  Future<void> update(Database db, Note note) async =>
      await _store.record(note.id!).put(db, note.toMap());

  Future<void> delete(Database db, int id) async =>
      await _store.record(id).delete(db);
}
