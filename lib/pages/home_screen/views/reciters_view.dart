import 'package:flutter/material.dart';
import 'package:islami_app/pages/home_screen/widgets/reciters_card.dart';

class RecitersView extends StatelessWidget {
  const RecitersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                const RecitersCard(title: ' Ibrahim Al-Akdar'),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
