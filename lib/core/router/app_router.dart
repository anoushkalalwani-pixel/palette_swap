import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/home/home_screen.dart';
import '../../features/loading/loading_screen.dart';
import '../../features/results/results_screen.dart';
import '../../features/upload/upload_screen.dart';
import '../../models/recommendation.dart';

/// Declarative navigation configuration for the application.
///
/// Defines the four screens of the core flow — home, upload, loading, and
/// results — and the transitions between them. Complex payloads (the selected
/// image and the produced recommendation) are passed via [GoRouterState.extra]
/// because they are in-memory objects that never need to survive a deep link.
abstract final class AppRouter {
  /// The path of the home route.
  static const String homePath = '/';

  /// The path of the upload route.
  static const String uploadPath = '/upload';

  /// The path of the loading route.
  static const String loadingPath = '/loading';

  /// The path of the results route.
  static const String resultsPath = '/results';

  /// The name of the home route.
  static const String homeName = 'home';

  /// The name of the upload route.
  static const String uploadName = 'upload';

  /// The name of the loading route.
  static const String loadingName = 'loading';

  /// The name of the results route.
  static const String resultsName = 'results';

  /// The application's [GoRouter] instance.
  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: [
      GoRoute(
        path: homePath,
        name: homeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: uploadPath,
        name: uploadName,
        builder: (context, state) => const UploadScreen(),
      ),
      GoRoute(
        path: loadingPath,
        name: loadingName,
        builder: (context, state) =>
            LoadingScreen(image: state.extra! as XFile),
      ),
      GoRoute(
        path: resultsPath,
        name: resultsName,
        builder: (context, state) =>
            ResultsScreen(recommendation: state.extra! as Recommendation),
      ),
    ],
  );
}
