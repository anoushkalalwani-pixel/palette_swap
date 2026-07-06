import 'package:go_router/go_router.dart';

import '../../features/home/home_screen.dart';

/// Declarative navigation configuration for the application.
///
/// Additional routes (upload, loading, results) will be added as those
/// features are built out.
abstract final class AppRouter {
  /// The path of the home route.
  static const String homePath = '/';

  /// The application's [GoRouter] instance.
  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: [
      GoRoute(
        path: homePath,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
