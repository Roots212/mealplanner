import 'package:get_it/get_it.dart';
import 'package:mealplanner/features/auth/presentation/blocs/cubit/stepper/stepper_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => StepperCubit());
}
