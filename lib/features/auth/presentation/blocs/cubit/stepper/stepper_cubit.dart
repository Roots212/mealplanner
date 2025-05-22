import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_state.dart';
part 'stepper_cubit.freezed.dart';

class StepperCubit extends Cubit<StepperState> {
  final int maxSteps = 3;
  StepperCubit() : super(StepperState.initial(step: 0));

  void nextStep() {
    final nextStep = state.step + 1;
    if (nextStep <= maxSteps) {
      emit(state.copyWith(step: nextStep));
    }
  }

  void previousStep() {
    final previousStep = state.step - 1;
    if (previousStep >= 0) {
      emit(state.copyWith(step: previousStep));
    }
  }
}
