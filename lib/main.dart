import 'package:flutter/material.dart';

import 'package:islami_app/core/utils/app_themes.dart';
import 'package:islami_app/pages/hadeeth_screen/hadeeth_screen.dart';
import 'package:islami_app/pages/home_screen/home_screen.dart';
import 'package:islami_app/pages/intro_screen/intro_screen.dart';
import 'package:islami_app/pages/quran_screen/quran_screen.dart';
import 'package:islami_app/pages/splash_screen_custome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreenCustome.routeName: (_) => const SplashScreenCustome(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        IntroScreen.routeName: (_) => const IntroScreen(),
        QuranScreen.routeName: (_) => const QuranScreen(),
        HadeethScreen.routeName: (_) => const HadeethScreen(),
      },
      title: 'Islami app ',
      initialRoute: SplashScreenCustome.routeName,
    );
  }
}
