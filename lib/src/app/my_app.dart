import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/home_screen.dart';
import 'package:super_app_behpardaz/src/shared/theme/provider/theme_controller.dart';
import 'package:super_app_behpardaz/src/shared/theme/provider/theme_provider.dart';


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeControllerProvider.notifier);
    final appTheme = ref.watch(themeControllerProvider).maybeWhen(
      data: (themeState) => themeState.appTheme,
      orElse: () => AppTheme.system,
    );
    return MaterialApp(
      theme: themeController.getTheme(appTheme),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('fa', ''), // Farsi
      ],
      locale: const Locale('fa'),
      home: const HomeScreen(),
    );
  }
}

