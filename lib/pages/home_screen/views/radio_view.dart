import 'package:flutter/material.dart';
import 'package:islami_app/pages/home_screen/widgets/radio_card.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                const RadioCard(title: 'Radio Ibrahim Al-Akdar'),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
