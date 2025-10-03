import 'package:go_router/go_router.dart';
import '../features/notes/presentation/note_detail/note_detail_page.dart';
import '../features/notes/presentation/note_list/note_list_page.dart';
import '../features/settings/settings_page.dart';

enum AppRoute {
  home,
  note,
  settings,
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (_, __) => const NoteListPage(),
      routes: [
        GoRoute(
          path: 'note/:id',
          name: AppRoute.note.name,
          builder: (_, state) {
            final id = int.tryParse(state.pathParameters['id'] ?? '');
            return NoteDetailPage(noteId: id);
          },
        ),
        GoRoute(
          path: 'settings',
          name: AppRoute.settings.name,
          builder: (_, __) => const SettingsPage(),
        ),
      ],
    ),
  ],
);