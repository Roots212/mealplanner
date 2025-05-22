import 'package:go_router/go_router.dart';
import 'package:mealplanner/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mealplanner/features/auth/presentation/screens/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "splash",
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: "onboarding",
        path: "/onboarding",
        builder: (context, state) => const GetStartedScreen(),
      ),
    ],
  );
}

class AppRoutes {
  static const String splash = "/";
  static const String getStarted = "/onboarding";
}
