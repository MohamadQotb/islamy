import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/models/quran_model_class.dart';
import 'package:islami_app/pages/home_screen/widgets/most_recentley_card.dart';

class MostRecentlyView extends StatelessWidget {
  final List<int> filteredSuras;
  const MostRecentlyView({super.key, required this.filteredSuras});

  @override
  Widget build(BuildContext context) {
    var suras = filteredSuras
        .map(
          (e) => QuranModelClass.suras[e - 1],
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemBuilder: (context, index) => MostRecentleyCard(
              sura: suras[index],
            ),
            itemCount: suras.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
