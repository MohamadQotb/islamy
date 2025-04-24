import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class RecitersCard extends StatefulWidget {
  final String title;
  const RecitersCard({super.key, required this.title});

  @override
  State<RecitersCard> createState() => _RecitersCardState();
}

class _RecitersCardState extends State<RecitersCard> {
  bool muted = false;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: AppColors.gold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(AppAssets.quranScreenBottom),
              colorFilter: ColorFilter.mode(
                  AppColors.black.withOpacity(0.7), BlendMode.srcIn),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: AppColors.black,
                        size: 50,
                      )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        muted = !muted;
                      });
                    },
                    icon: Icon(
                      muted
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      color: AppColors.black,
                      size: 36,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
