import 'package:flutter/material.dart';
import 'package:mealplanner/core/colors/colors.dart';
import 'package:mealplanner/gen/fonts.gen.dart';

class PerferencesScreen extends StatelessWidget {
  final String title;
  const PerferencesScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 150),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontFamily: FontFamily.junigardenSwash,
          ),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            cursorColor: AppColors.purple,
            decoration: InputDecoration(focusColor: AppColors.purple),
          ),
        ),
      ],
    );
  }
}
