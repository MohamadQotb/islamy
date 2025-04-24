import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/pages/home_screen/widgets/back_ground_widget.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGroundWidget(
        backGroundImage: AppAssets.timeBackGroundImage, child: Column());
  }
}
