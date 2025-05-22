import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealplanner/core/colors/colors.dart';
import 'package:mealplanner/core/navigation/router.dart';
import 'package:mealplanner/core/presentation/widgets/button.dart';
import 'package:mealplanner/gen/assets.gen.dart';
import 'package:mealplanner/gen/fonts.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Assets.images.splash.image(scale: 0.1),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.9, 1.0],
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      AppColors.purple,
                      AppColors.purple,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Text(
                  "Meal Planner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,

                    fontFamily: FontFamily.junigardenSwash,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Just relax and not overthink what to eat. This is in our side with our personalized meal plans just prepared and adapted to your needs.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,

                fontFamily: FontFamily.junigardenSwash,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 400,
            child: CustomButton(
              title: "Get  Started",
              onPress: () => context.go(AppRoutes.getStarted),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
