import 'package:get/get.dart';

import '../../core/auth/auth_service.dart';
import '../../models/movie_model.dart';
import '../../services/movies/movies_service.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
  void onReady() {
    super.onReady();
    getMovies();
  }

  Future<void> getMovies() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorites(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(user.uid, movie);
      movies.remove(movie);
    }
  }
}
