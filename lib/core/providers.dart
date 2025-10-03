import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Single Sembast database instance for the whole app.
@Riverpod(keepAlive: true)
Future<Database> sembastDB(Ref ref) async {
  final String dbPath;
  if (kIsWeb) {
    // web: in-memory (or indexedDB via sembast_web)
    dbPath = 'notes.db'; // sembast_web ignores the real path
    return databaseFactoryWeb.openDatabase(dbPath);
  } else {
    // mobile / desktop
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    dbPath = '${dir.path}/notes.db';
    return databaseFactoryIo.openDatabase(dbPath);
  }
}
