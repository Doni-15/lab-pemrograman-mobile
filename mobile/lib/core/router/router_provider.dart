import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anime_verse/core/router/routes.dart';
import 'package:anime_verse/core/widgets/anime_app_shell.dart';
import 'package:anime_verse/feature/auth/presentation/pages/sign_in_screen.dart';
import 'package:anime_verse/feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:anime_verse/feature/detail/presentation/pages/detail_screen.dart';
import 'package:anime_verse/feature/home/presentation/pages/search_screen.dart';

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
