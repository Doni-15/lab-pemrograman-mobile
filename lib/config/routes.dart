abstract final class Routes {
  static const login = '/login';
  static const register = '/register';
  static const app = '/app';
  static const search = '/search';
  static const detail = '/detail/:id';

  static String detailPath(String animeId) => '/detail/$animeId';
}
