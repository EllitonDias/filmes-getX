import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContentTitle extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailContentTitle({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            movieDetailModel?.title ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            value: (movieDetailModel?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: Colors.orange,
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieDetailModel?.genres.map((e) => e.name).join(', ') ?? '',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white70,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
