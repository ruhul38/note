import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:note_app/core/router.dart';

import '../../data/note_repo.dart';
import 'note_list_ctrl.dart';

class NoteListPage extends ConsumerWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(AppRoute.settings.name),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            context.pushNamed(AppRoute.note.name, pathParameters: {'id': '-1'}),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) => Center(child: Text(e.toString())),
        data: (notes) => notes.isEmpty
            ? const Center(child: Text('No notes yet'))
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, i) {
                  final n = notes[i];
                  return ListTile(
                    title: Text(n.title),
                    subtitle: Text(
                      n.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        final repo = await ref.read(noteRepoProvider.future);
                        await repo.delete(n.id!);
                        ref.invalidate(notesProvider);
                      },
                    ),
                    onTap: () => context.pushNamed(
                      AppRoute.note.name,
                      pathParameters: {'id': n.id.toString()},
                    ),
                  );
                },
              ),
      ),
    );
  }
}
