import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/rest_client/rest_client.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_key'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      throw Exception('Erro ao buscar os filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_key'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      throw Exception('Erro ao buscar os filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_key'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );
    if (result.hasError) {
      throw Exception('Erro ao buscar detalhes do filme');
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movieModel) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('movies');

      if (movieModel.favorite) {
        favoriteCollection.add(movieModel.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movieModel.id)
            .limit(1)
            .get();

        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();
    final listFavorites = <MovieModel>[];
    for (var movie in favoritesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
