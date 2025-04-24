import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_constants.dart';
import 'package:islami_app/pages/home_screen/home_screen.dart';
import 'package:islami_app/pages/intro_screen/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenCustome extends StatefulWidget {
  static const String routeName = '/SplashScreenCustome';

  const SplashScreenCustome({
    super.key,
  });

  @override
  State<SplashScreenCustome> createState() => _SplashScreenCustomeState();
}

class _SplashScreenCustomeState extends State<SplashScreenCustome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        _checkIfRegistered();
      },
    );
  }

  Future<void> _checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstOpen = prefs.getBool(AppConstants.isFirstOpenKey) ?? true;
    if (isFirstOpen) {
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
      prefs.setBool(AppConstants.isFirstOpenKey, false);
      setState(() {});
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/costumeSplashScreen.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
