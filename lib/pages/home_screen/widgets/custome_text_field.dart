import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomeTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomeTextField(
      {super.key, this.onChanged, this.controller, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: 'Sura Name',
        hintStyle: const TextStyle(
            color: AppColors.gold, fontSize: 16, fontWeight: FontWeight.w700),
        filled: true,
        fillColor: AppColors.black.withOpacity(.7),
        prefixIcon: Container(
          width: 28,
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            AppAssets.quranBottomNavBar,
            color: AppColors.gold,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.0),
        ),
      ),
      style: const TextStyle(
          color: AppColors.gold, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}
