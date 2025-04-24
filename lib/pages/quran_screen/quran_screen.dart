import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/pages/home_screen/models/quran_model_class.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = '/quranScreen';
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late QuranModelClass sura;
  bool loaded = true;
  bool loading = false;
  bool success = false;
  bool error = false;
  String errorMessage = '';
  List<String> suraContent = [];
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as QuranModelClass;
    if (loaded) {
      loadQuran();
      loaded = false;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          sura.enName,
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
                    sura.arName,
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
            loading
                ? const Expanded(
                    child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.gold,
                    ),
                  ))
                : success
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SingleChildScrollView(
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.gold,
                                      ),
                                      children: List.generate(
                                        suraContent.length,
                                        (index) => TextSpan(
                                            text: '${suraContent[index]}(${index + 1}) '),
                                      )))),
                        ),
                      )
                    : Expanded(
                        child: Center(
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
            Image.asset(
              AppAssets.quranScreenBottom,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }

  Future<void> loadQuran() async {
    try {
      loading = true;

      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      String fileContent =
          await rootBundle.loadString('assets/Suras/${sura.suraCount}.txt');
      suraContent = fileContent.trim().split('\n');
      loading = false;
      success = true;
      setState(() {});
    } catch (e) {
      loading = false;
      error = true;
      errorMessage = e.toString();
      setState(() {});
    }
  }
}
