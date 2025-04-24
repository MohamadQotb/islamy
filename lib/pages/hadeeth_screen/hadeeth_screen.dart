import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/models/hadeeth_model_class.dart';

class HadeethScreen extends StatelessWidget {
  static const String routeName = '/hadeethscreen';
  const HadeethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeeth =
        ModalRoute.of(context)!.settings.arguments as HadeethModelClass;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          'Hadeeth ${hadeeth.hadeethNumber}',
          style: const TextStyle(
            color: AppColors.gold,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        )),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.quranScreenLeft),
                  Text(
                    hadeeth.hadeethTitle,
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(AppAssets.quranScreenRight),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                    child: Text(
                  hadeeth.hadeethContent,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold,
                  ),
                )),
              ),
            ),
            Image.asset(
              AppAssets.quranScreenBottom,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
