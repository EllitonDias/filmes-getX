import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');
  final MovieModel movieModel;
  final VoidCallback favoriteCallback;
  MovieCard({
    super.key,
    required this.movieModel,
    required this.favoriteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/movie/detail', arguments: movieModel.id),
      child: Container(
        width: 148,
        height: 280,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movieModel.posterPath}',
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movieModel.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  dateFormat.format(
                    DateTime.parse(movieModel.realeaseDate),
                  ),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 60,
              right: -6,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                shadowColor: Colors.white,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: favoriteCallback,
                    icon: Icon(
                      movieModel.favorite
                          ? Icons.favorite_sharp
                          : Icons.favorite_border,
                      color: movieModel.favorite ? Colors.red : Colors.black,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
