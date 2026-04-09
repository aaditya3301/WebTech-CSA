import 'package:flutter/material.dart';

import 'models/tip_model.dart';
import 'screens/about_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tip_detail_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        AboutScreen.routeName: (_) => const AboutScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == TipDetailScreen.routeName &&
            settings.arguments is FitnessTip) {
          final tip = settings.arguments! as FitnessTip;
          return MaterialPageRoute<void>(
            builder: (_) => TipDetailScreen(tip: tip),
            settings: settings,
          );
        }
        return null;
      },
      onUnknownRoute: (_) => MaterialPageRoute<void>(
        builder: (_) => const HomeScreen(),
      ),
    );
  }
}
