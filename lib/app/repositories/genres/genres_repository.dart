import '../../models/genre_model.dart';

abstract interface class GenresRepository {
  Future<List<GenreModel>> getGenres();
}
