import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../service/haptic_service.dart';
import '_build_context_extension.dart';
import '_colors.dart';
import '_typography.dart';
import 'app.dart';

class AppBase extends StatelessWidget {
  @override
  build(context) {
    ThemeData theme(Brightness brightness) {
      final colorScheme = ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: AppColors.seedColor,
        secondary: AppColors.secondarySeed,
        tertiary: AppColors.tertiarySeed,
      );

      return ThemeData(
        colorScheme: colorScheme,
        textTheme: AppTypography.textTheme(colorScheme),
        useMaterial3: true,

        // Card theme with surface tint
        cardTheme: CardThemeData(
          surfaceTintColor: colorScheme.surfaceTint,
          elevation: 0,
        ),

        // AppBar theme
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.onSurface,
        ),

        // Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            textStyle: AppTypography.textTheme(colorScheme).labelLarge,
          ),
        ),

        // Text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: AppTypography.textTheme(colorScheme).labelLarge,
          ),
        ),

        // Icon button theme
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: colorScheme.onSurface,
          ),
        ),

        // Dialog theme
        dialogTheme: DialogTheme(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
    }

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        navigatorObservers: [sl<HapticService>()],
        title: 'Bible Feed',
        themeMode: ThemeMode.system,
        theme: theme(Brightness.light),
        darkTheme: theme(Brightness.dark),
        home: App(),
      ),
    );
  }
}
