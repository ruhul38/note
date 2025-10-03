import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'core/theme.dart';
import 'features/settings/settings_ctrl.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeCtrlProvider);
    final fontSize = ref.watch(fontSizeCtrlProvider);

    final baseTheme = mode == ThemeMode.dark ? darkTheme : lightTheme;
    final scaledTextTheme = baseTheme.textTheme
        .copyWith(
          // fill every null size with 14 before we scale
          displayLarge: baseTheme.textTheme.displayLarge?.copyWith(
            fontSize: baseTheme.textTheme.displayLarge?.fontSize ?? 14,
          ),
          displayMedium: baseTheme.textTheme.displayMedium?.copyWith(
            fontSize: baseTheme.textTheme.displayMedium?.fontSize ?? 14,
          ),
          displaySmall: baseTheme.textTheme.displaySmall?.copyWith(
            fontSize: baseTheme.textTheme.displaySmall?.fontSize ?? 14,
          ),
          headlineLarge: baseTheme.textTheme.headlineLarge?.copyWith(
            fontSize: baseTheme.textTheme.headlineLarge?.fontSize ?? 14,
          ),
          headlineMedium: baseTheme.textTheme.headlineMedium?.copyWith(
            fontSize: baseTheme.textTheme.headlineMedium?.fontSize ?? 14,
          ),
          headlineSmall: baseTheme.textTheme.headlineSmall?.copyWith(
            fontSize: baseTheme.textTheme.headlineSmall?.fontSize ?? 14,
          ),
          titleLarge: baseTheme.textTheme.titleLarge?.copyWith(
            fontSize: baseTheme.textTheme.titleLarge?.fontSize ?? 14,
          ),
          titleMedium: baseTheme.textTheme.titleMedium?.copyWith(
            fontSize: baseTheme.textTheme.titleMedium?.fontSize ?? 14,
          ),
          titleSmall: baseTheme.textTheme.titleSmall?.copyWith(
            fontSize: baseTheme.textTheme.titleSmall?.fontSize ?? 14,
          ),
          bodyLarge: baseTheme.textTheme.bodyLarge?.copyWith(
            fontSize: baseTheme.textTheme.bodyLarge?.fontSize ?? 14,
          ),
          bodyMedium: baseTheme.textTheme.bodyMedium?.copyWith(
            fontSize: baseTheme.textTheme.bodyMedium?.fontSize ?? 14,
          ),
          bodySmall: baseTheme.textTheme.bodySmall?.copyWith(
            fontSize: baseTheme.textTheme.bodySmall?.fontSize ?? 14,
          ),
          labelLarge: baseTheme.textTheme.labelLarge?.copyWith(
            fontSize: baseTheme.textTheme.labelLarge?.fontSize ?? 14,
          ),
          labelMedium: baseTheme.textTheme.labelMedium?.copyWith(
            fontSize: baseTheme.textTheme.labelMedium?.fontSize ?? 14,
          ),
          labelSmall: baseTheme.textTheme.labelSmall?.copyWith(
            fontSize: baseTheme.textTheme.labelSmall?.fontSize ?? 14,
          ),
        )
        .apply(fontSizeFactor: fontSize / 14); // safe to scale now

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(textTheme: scaledTextTheme),
      darkTheme: darkTheme.copyWith(textTheme: scaledTextTheme),
      themeMode: mode,
      routerConfig: router,
    );
  }
}

// lib/app.dart
