import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_ctrl.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeCtrlProvider);
    final fontSize = ref.watch(fontSizeCtrlProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark mode'),
            trailing: Switch(
              value: theme == ThemeMode.dark,
              onChanged: (v) => ref
                  .read(themeModeCtrlProvider.notifier)
                  .set(v ? ThemeMode.dark : ThemeMode.light),
            ),
          ),
          ListTile(
            title: const Text('Font size'),
            subtitle: Slider(
              value: fontSize,
              min: 12,
              max: 24,
              divisions: 12,
              label: fontSize.toStringAsFixed(0),
              onChanged: (v) => ref.read(fontSizeCtrlProvider.notifier).set(v),
            ),
          ),
        ],
      ),
    );
  }
}
