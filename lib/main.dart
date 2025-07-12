import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'routes.dart';

void main() {
  runApp(const ZentroCallApp());
}

/// Asosiy ilova klassi
class ZentroCallApp extends StatelessWidget {
  const ZentroCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZentroCall',
      debugShowCheckedModeBanner: false,

      // Tema sozlamalari
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Avtomatik tema
      // Lokalizatsiya (keyinchalik qo'shiladi)
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('uz', 'UZ'), // O'zbek tili
      //   Locale('ru', 'RU'), // Rus tili
      //   Locale('en', 'US'), // Ingliz tili
      // ],
      // locale: const Locale('uz', 'UZ'), // Boshlang'ich til
      // Navigatsiya
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,

      // BLoC Provider
      home: const SplashScreen(),
    );
  }
}
