import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';
import 'movie_detail_content_credits.dart';
import 'movie_detail_content_main_cast.dart';
import 'movie_detail_content_production_credits.dart';
import 'movie_detail_content_title.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailContent({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movieDetailModel: movieDetailModel),
        MovieDetailContentCredits(movieDetailModel: movieDetailModel),
        MovieDetailContentProductionCredits(movieDetailModel: movieDetailModel),
        MovieDetailContentMainCast(movieDetailModel: movieDetailModel),
      ],
    );
  }
}
