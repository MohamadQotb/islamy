import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/pages/home_screen/widgets/back_ground_widget.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int quarterTurns = 1;
  int counter = 0;
  List<String> sebha = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size dem = MediaQuery.of(context).size;
    return BackGroundWidget(
        backGroundImage: AppAssets.sebhaBackGroundImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              AppAssets.sebhaHeadImage,
              height: dem.height * .1,
            ),
            GestureDetector(
              onTap: () {
                quarterTurns += 6;
                counter++;
                if (counter == 34) {
                  counter = 0;
                  index++;
                  if (index == sebha.length) {
                    index = 0;
                  }
                }
                setState(() {});
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: quarterTurns * pi / 180,
                    child: Image.asset(
                      AppAssets.sebhaBodyImage,
                      height: dem.height * .44,
                    ),
                  ),
                  Text(
                    "${sebha[index]}\n\n$counter",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textDirection: TextDirection.rtl,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
