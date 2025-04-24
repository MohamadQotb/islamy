import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/models/quran_model_class.dart';
import 'package:islami_app/pages/home_screen/widgets/sura_list_tile.dart';

class SurasListView extends StatelessWidget {
  final void Function(int) onTap;
  const SurasListView({
    super.key,
    required this.searchText,
    required this.onTap,
  });
  final String searchText;

  @override
  Widget build(BuildContext context) {
    List filteredSuras = QuranModelClass.suras.where((sura) {
      return sura.enName.toLowerCase().contains(searchText.toLowerCase()) ||
          sura.arName.contains(searchText);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suras List',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => SuraListTile(
            sura: filteredSuras[index],
            onTap: onTap,
          ),
          itemCount: filteredSuras.length,
          scrollDirection: Axis.vertical,
        ),
      ],
    );
  }
}
