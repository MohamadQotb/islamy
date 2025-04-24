import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomeToggleButtonsWidget extends StatefulWidget {
  int currentIndex;
  final void Function(int) onPressed;
  CustomeToggleButtonsWidget(
      {super.key, required this.currentIndex, required this.onPressed});

  @override
  State<CustomeToggleButtonsWidget> createState() =>
      _CustomeToggleButtonsWidgetState();
}

class _CustomeToggleButtonsWidgetState
    extends State<CustomeToggleButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ToggleButtons(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width / 2 - 20,
            minHeight: 40,
          ),
          isSelected: [widget.currentIndex == 0, widget.currentIndex == 1],
          borderRadius: BorderRadius.circular(12),
          selectedColor: AppColors.black,
          fillColor: AppColors.gold,
          color: Colors.white,
          borderColor: AppColors.black.withOpacity(0.7),
          selectedBorderColor: AppColors.black.withOpacity(0.7),
          onPressed: widget.onPressed,
          children: [
            Text("Radio"),
            Text("Reciters"),
          ],
        ),
      ),
    );
  }
}
