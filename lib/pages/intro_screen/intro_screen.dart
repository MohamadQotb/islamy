import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';

import 'package:islami_app/pages/intro_screen/models/intro_model_class.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/IntroScreen';

  const IntroScreen({
    super.key,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  void nextPage() {
    if (currentPage < 4) {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.of(context).pushReplacementNamed('/homescreen');
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.animateToPage(currentPage - 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  List<IntroModelClass> introList = [
    IntroModelClass(
      imagePath: AppAssets.tarheebIntro,
      title: 'Welcome To Islmi App',
    ),
    IntroModelClass(
      imagePath: AppAssets.mosqueIntro,
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    IntroModelClass(
      imagePath: AppAssets.quranIntro,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    IntroModelClass(
      imagePath: AppAssets.sebhaIntro,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    IntroModelClass(
      imagePath: AppAssets.radioIntro,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssets.appBarMosque,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) =>
                      Image.asset(introList[currentPage].imagePath),
                  itemCount: introList.length,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  allowImplicitScrolling: true,
                ),
              ),
              Text(
                introList[currentPage].title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gold,
                ),
              ),
              Text(
                introList[currentPage].description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        previousPage();
                      },
                      child: Text(
                        currentPage == 0 ? '' : 'Back',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                        ),
                      )),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      activeDotColor: AppColors.gold,
                      dotColor: AppColors.grey,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        nextPage();
                      },
                      child: Text(
                        currentPage == 4 ? 'Finish' : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
