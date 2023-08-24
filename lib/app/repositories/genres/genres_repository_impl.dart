import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/rest_client/rest_client.dart';
import '../../models/genre_model.dart';
import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_key'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((genre) => GenreModel.fromMap(genre))
              .toList();
        }
        return <GenreModel>[];
      },
    );
    
    if (result.hasError) {
      throw Exception('Erro ao buscar genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
