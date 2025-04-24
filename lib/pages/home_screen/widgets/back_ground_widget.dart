import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class BackGroundWidget extends StatelessWidget {
  final String backGroundImage;
  final Widget child;
  final BoxFit? fit;
  const BackGroundWidget(
      {super.key,
      required this.backGroundImage,
      required this.child,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backGroundImage),
            fit: fit ?? BoxFit.cover,
            alignment: Alignment.topCenter),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.black.withOpacity(0.7), AppColors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [.3, 1]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
