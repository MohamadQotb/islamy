import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_constants.dart';
import 'package:islami_app/pages/home_screen/models/quran_model_class.dart';
import 'package:islami_app/pages/home_screen/views/most_recently_view.dart';
import 'package:islami_app/pages/home_screen/views/suras_list_view.dart';

import 'package:islami_app/pages/home_screen/widgets/back_ground_widget.dart';
import 'package:islami_app/pages/home_screen/widgets/custome_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController searchController = TextEditingController();
  List<int> filteredSuras = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? mostRecentList =
        prefs.getStringList(AppConstants.mostRecentKey);
    if (mostRecentList != null) {
      filteredSuras = mostRecentList.map((e) => int.parse(e)).toList();
    } else {
      filteredSuras = [];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: BackGroundWidget(
          backGroundImage: AppAssets.quranBackGroundImage,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeTextField(
                  suffixIcon: InkWell(
                    child: const Icon(Icons.clear),
                    onTap: () {
                      searchController.clear();
                      setState(() {});
                    },
                  ),
                  controller: searchController,
                  onChanged: (p0) {
                    if (p0.length > 3) {
                      setState(() {});
                    } else if (p0.isEmpty) {
                      setState(() {});
                    }
                  },
                ),
                Expanded(
                    child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: filteredSuras.isNotEmpty,
                      child: MostRecentlyView(
                        filteredSuras: filteredSuras,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SurasListView(
                      onTap: addMostRecentSura,
                      searchText: searchController.text,
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }

  void addMostRecentSura(int index) {
    filteredSuras.insert(0, QuranModelClass.suras[index].suraCount);
    filteredSuras = filteredSuras.toSet().toList();
    if (filteredSuras.length > 5) {
      filteredSuras.removeLast();
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setStringList(AppConstants.mostRecentKey,
          filteredSuras.map((e) => e.toString()).toList());
    });

    setState(() {});
  }
}
