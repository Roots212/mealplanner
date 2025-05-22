part of 'stepper_cubit.dart';

@freezed
class StepperState with _$StepperState {
  const factory StepperState.initial({required int step}) = _Initial;

  @override
  // TODO: implement step
  int get step => throw UnimplementedError();
}
