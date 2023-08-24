import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContentCredits extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailContentCredits({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: Text(
          movieDetailModel?.overview ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
