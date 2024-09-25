import 'package:go_router/go_router.dart';

import '../../../presentation/pages/dashboard.dart';
import '../../../presentation/pages/login_page.dart';
import '../../../presentation/pages/note_details.dart';
import '../../../presentation/pages/signup_page.dart';
import '../../../presentation/pages/splash_page.dart';
import 'route_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: RouteName.kRoot,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteName.kHome,
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: RouteName.kDetails,
      builder: (context, state) {
        var extras = state.extra as Map<String, dynamic>?;
        if (extras?["for_edit"] ?? false) {
          return NoteDetails(id: extras?["id"], forEdit: true,);
        }
        return const NoteDetails();
      },
    ),
    GoRoute(
      path: RouteName.kLogin,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteName.kSignup,
      builder: (context, state) => const SignupPage(),
    ),
  ]);
}
