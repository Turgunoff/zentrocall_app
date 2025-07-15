import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();
  runApp(BlocProvider.value(value: themeCubit, child: const ZentroCallApp()));
}

/// Asosiy ilova klassi
class ZentroCallApp extends StatelessWidget {
  const ZentroCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'ZentroCall',
          debugShowCheckedModeBanner: false,

          // Tema sozlamalari
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
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
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
