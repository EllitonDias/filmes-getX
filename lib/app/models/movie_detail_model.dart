// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'cast_model.dart';
import 'genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'vote_average': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'release_date': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'production_companies': productionCompanies,
      'original_language': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'];
    var urlImages = urlImagesPosters
            ?.map<String>(
              (i) => 'https://image.tmdb.org/t/p/w500/${i['file_path']}',
            )
            .toList() ??
        [];

    return MovieDetailModel(
      title: map['title'] as String,
      stars: map['vote_average'] as double,
      genres: List<GenreModel>.from(
        map['genres']?.map<GenreModel>((x) => GenreModel.fromMap(x)) ??
            const [],
      ),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] as String,
      productionCompanies: List<dynamic>.from(map['production_companies'] ?? [])
          .map<String>((p) => p['name'])
          .toList(),
      originalLanguage: map['original_language'] as String,
      cast: List<CastModel>.from(
        map['credits']['cast']?.map((cast) => CastModel.fromMap(cast)) ??
            const [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
