import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/pages/home_screen/views/radio_view.dart';
import 'package:islami_app/pages/home_screen/views/reciters_view.dart';
import 'package:islami_app/pages/home_screen/widgets/back_ground_widget.dart';
import 'package:islami_app/pages/home_screen/widgets/custome_toggle_buttons_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<Widget> tabs = [
    const RadioView(),
    const RecitersView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
        backGroundImage: AppAssets.radioBackGroundImaGE,
        child: Column(
          children: [
            CustomeToggleButtonsWidget(
              currentIndex: index,
              onPressed: (p0) {
                setState(() {
                  index = p0;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: tabs[index]),
          ],
        ));
  }
}
