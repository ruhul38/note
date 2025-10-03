import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_ctrl.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(Ref ref) => throw UnimplementedError(); // overridden in main

@riverpod
class ThemeModeCtrl extends _$ThemeModeCtrl {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPrefsProvider);
    final index = prefs.getInt('theme') ?? 0;
    return ThemeMode.values[index];
  }

  Future<void> set(ThemeMode mode) async {
    final prefs = ref.watch(sharedPrefsProvider);
    await prefs.setInt('theme', mode.index);
    state = mode;
  }
}

@riverpod
class FontSizeCtrl extends _$FontSizeCtrl {
  @override
  double build() {
    final prefs = ref.watch(sharedPrefsProvider);
    return prefs.getDouble('font') ?? 14.0;
  }

  Future<void> set(double size) async {
    final prefs = ref.watch(sharedPrefsProvider);
    await prefs.setDouble('font', size);
    state = size;
  }
}
