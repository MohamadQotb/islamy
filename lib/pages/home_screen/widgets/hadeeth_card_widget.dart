import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/models/hadeeth_model_class.dart';

class HadeethCardWidget extends StatelessWidget {
  final HadeethModelClass hadeeth;

  const HadeethCardWidget({super.key, required this.hadeeth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/hadeethscreen', arguments: hadeeth);
      },
      child: Card(
        margin: const EdgeInsets.all(6),
        color: AppColors.gold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssets.quranIntro,
                fit: BoxFit.contain,
                color: AppColors.black.withOpacity(0.4),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          AppAssets.quranScreenLeft,
                          color: AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Text(
                            hadeeth.hadeethTitle,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          AppAssets.quranScreenRight,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Text(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        hadeeth.hadeethContent,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.quranScreenBottom,
                  fit: BoxFit.fitWidth,
                  color: AppColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
