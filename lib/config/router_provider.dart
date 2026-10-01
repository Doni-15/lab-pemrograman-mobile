import 'package:anime_verse/config/routes.dart';
import 'package:anime_verse/screens/detail_screen.dart';
import 'package:anime_verse/screens/home/widgets/search_screen.dart';
import 'package:anime_verse/screens/sign_up_screen.dart';
import 'package:anime_verse/widgets/anime_app_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anime_verse/screens/sign_in_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.app,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: Routes.app,
        builder: (context, state) => const AnimeAppShell(),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: Routes.detail,
        builder: (context, state) {
          final animeId = state.pathParameters['id'] ?? '';
          return DetailScreen(animeId: animeId);
        },
      ),
    ],
  );
});
