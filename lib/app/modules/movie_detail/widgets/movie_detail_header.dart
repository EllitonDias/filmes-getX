import 'package:flutter/material.dart';
import '../../../models/movie_detail_model.dart';


class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailHeader({Key? key, required this.movieDetailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movieDetailModel != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieDetailModel!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieDetailModel!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
