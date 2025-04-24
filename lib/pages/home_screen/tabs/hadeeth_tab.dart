import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/pages/home_screen/models/hadeeth_model_class.dart';
import 'package:islami_app/pages/home_screen/widgets/back_ground_widget.dart';
import 'package:islami_app/pages/home_screen/widgets/hadeeth_card_widget.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  int currentPage = 0;
  List<HadeethModelClass> hadeethList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
        fit: BoxFit.contain,
        backGroundImage: AppAssets.hadeethBackGroundImage,
        child: PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 0.8,
          ),
          itemBuilder: (context, index) => currentPage == index
              ? HadeethCardWidget(hadeeth: hadeethList[index])
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: HadeethCardWidget(hadeeth: hadeethList[index]),
                ),
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemCount: hadeethList.length,
        ));
  }

  Future<void> loadHadeeth() async {
    for (int i = 0; i < 50; i++) {
      String hadeeth =
          await rootBundle.loadString('assets/Hadeeth/h${i + 1}.txt');
      List<String> hadeethContent = hadeeth.split('\n');
      HadeethModelClass currentHadeeth = HadeethModelClass(
        hadeethNumber: i + 1,
        hadeethTitle: hadeethContent[0],
        hadeethContent: hadeethContent.sublist(1).toString(),
      );
      hadeethList.add(currentHadeeth);
    }

    setState(() {});
  }
}
