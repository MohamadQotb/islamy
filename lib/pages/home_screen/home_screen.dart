import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/tabs/hadeeth_tab.dart';
import 'package:islami_app/pages/home_screen/tabs/quran_tab.dart';
import 'package:islami_app/pages/home_screen/tabs/radio_tab.dart';
import 'package:islami_app/pages/home_screen/tabs/sebha_tab.dart';
import 'package:islami_app/pages/home_screen/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const QuranTab(),
    const HadeethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  AppAssets.quranBottomNavBar,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              icon: Image.asset(
                AppAssets.quranBottomNavBar,
                width: 20,
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  AppAssets.hadeethBottomNavBar,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              icon: Image.asset(
                AppAssets.hadeethBottomNavBar,
                width: 20,
              ),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  AppAssets.sebhaBottomNavBar,
                  width: 22,
                  color: Colors.white,
                ),
              ),
              icon: Image.asset(
                AppAssets.sebhaBottomNavBar,
                width: 20,
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  AppAssets.radioBottomNavBar,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              icon: Image.asset(
                AppAssets.radioBottomNavBar,
                width: 20,
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  AppAssets.timerBottomNavBar,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              icon: Image.asset(
                AppAssets.timerBottomNavBar,
                width: 20,
              ),
              label: 'Timer',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
        ),
        body: Stack(
          children: [
            tabs[currentIndex],
            Image.asset(
              AppAssets.appBarMosque,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
