import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/home_screen.dart';
import 'package:super_app_behpardaz/src/shared/theme/app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final darkTheme = DarkThemeData().materialThemeData;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
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

