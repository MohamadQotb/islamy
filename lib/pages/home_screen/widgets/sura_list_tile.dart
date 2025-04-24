import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/pages/home_screen/models/quran_model_class.dart';
import 'package:islami_app/pages/quran_screen/quran_screen.dart';

class SuraListTile extends StatelessWidget {
  final void Function(int) onTap;
  final QuranModelClass sura;
  const SuraListTile({super.key, required this.sura, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.starIcon,
            width: 52,
          ),
          Text(
            sura.suraCount.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
      title: Text(
        sura.enName,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        '${sura.verseCount} verses',
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
      ),
      trailing: Text(
        sura.arName,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      onTap: () {
        onTap(sura.suraCount - 1);
        Navigator.pushNamed(context, QuranScreen.routeName, arguments: sura);
      },
    );
  }
}
