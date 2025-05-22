import 'package:flutter/material.dart';
import 'package:mealplanner/core/navigation/router.dart';
import 'injection_container.dart' as ij;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ij.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
