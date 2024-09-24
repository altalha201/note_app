import 'package:go_router/go_router.dart';

import '../../../presentation/pages/dashboard.dart';
import '../../../presentation/pages/login_page.dart';
import '../../../presentation/pages/note_details.dart';
import '../../../presentation/pages/signup_page.dart';
import '../../../presentation/pages/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: "home",
          builder: (context, state) => const Dashboard(),
        ),
        GoRoute(
          path: "details",
          builder: (context, state) => const NoteDetails(),
        ),
        GoRoute(
          path: "auth/login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "auth/signup",
          builder: (context, state) => const SignupPage(),
        ),
      ],
    ),
  ]);
}
