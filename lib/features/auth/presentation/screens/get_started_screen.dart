import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealplanner/core/colors/colors.dart';
import 'package:mealplanner/core/presentation/widgets/button.dart';
import 'package:mealplanner/features/auth/presentation/blocs/cubit/stepper/stepper_cubit.dart';
import 'package:mealplanner/features/auth/presentation/screens/onboarding_screens/perferences_screen.dart';
import 'package:mealplanner/injection_container.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperCubit = sl<StepperCubit>();
    final pageController = PageController(initialPage: 0);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<StepperCubit, StepperState>(
        bloc: stepperCubit,
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (state.step > 0)
                  CustomButton(
                    title: "Prev",
                    showIcon: false,
                    backgroundColor: Colors.grey.shade300,
                    onPress: () => stepperCubit.previousStep(),
                    width: MediaQuery.sizeOf(context).width * 0.3,
                  ),
                CustomButton(
                  title: state.step == 3 ? "Done" : "Next",
                  showIcon: false,
                  backgroundColor: AppColors.purple,
                  textColor: Colors.white,
                  onPress: () => stepperCubit.nextStep(),
                  width: MediaQuery.sizeOf(context).width * 0.3,
                ),
              ],
            ),
          );
        },
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  AppColors.purple.withValues(alpha: 0.2),
                  Colors.white.withValues(alpha: 0.1),
                ],
              ),
            ),
          ),
          SafeArea(
            child: BlocConsumer<StepperCubit, StepperState>(
              bloc: stepperCubit,
              listener: (context, state) {
                pageController.animateToPage(
                  state.step,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              builder: (context, state) {
                return Column(
                  children: [
                    EasyStepper(
                      activeStepTextColor: AppColors.purple,
                      finishedStepTextColor: Colors.black87,
                      internalPadding: 50,
                      showLoadingAnimation: false,
                      stepRadius: 8,
                      showStepBorder: true,
                      activeStep: state.step,
                      enableStepTapping: false,
                      steps: [
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.purple,
                            ),
                          ),
                          title: 'Allergies',
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.purple,
                            ),
                          ),
                          title: 'Diet',
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.purple,
                            ),
                          ),
                          title: 'Dislikes',
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.purple,
                            ),
                          ),
                          title: 'Likes',
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        pageSnapping: true,
                        children: [
                          PerferencesScreen(
                            title: "Do you have any food allergies?",
                          ),
                          PerferencesScreen(
                            title: "Do you have any dietary preferences?",
                          ),
                          PerferencesScreen(
                            title:
                                "Do you have any food that you dislike particularly?",
                          ),

                          PerferencesScreen(
                            title:
                                "Do you have any food that you like particularly?",
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
