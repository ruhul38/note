import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'note_detail_ctrl.dart';

class NoteDetailPage extends ConsumerStatefulWidget {
  final int? noteId;
  const NoteDetailPage({required this.noteId, super.key});

  @override
  ConsumerState<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends ConsumerState<NoteDetailPage> {
  late final TextEditingController _t;
  late final TextEditingController _c;

  @override
  void initState() {
    super.initState();
    _t = TextEditingController();
    _c = TextEditingController();
  }

  @override
  void dispose() {
    _t.dispose();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(noteDetailCtrlProvider(widget.noteId));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => ref
                .read(noteDetailCtrlProvider(widget.noteId).notifier)
                .save(_t.text.trim(), _c.text.trim())
                .then((_) => context.pop()),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) => Center(child: Text(e.toString())),
        data: (note) {
          if (note != null) {
            _t.text = note.title;
            _c.text = note.content;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _t,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    textAlignVertical: TextAlignVertical.top,
                    controller: _c,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      labelText: 'Content',

                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
