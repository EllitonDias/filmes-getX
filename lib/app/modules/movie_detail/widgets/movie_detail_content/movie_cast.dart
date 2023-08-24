import 'package:flutter/material.dart';

import '../../../../models/cast_model.dart';

class MovieCast extends StatelessWidget {
  final CastModel? castModel;
  const MovieCast({super.key, this.castModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(5),
          //   clipBehavior: Clip.antiAlias,
          //   child: Image.network(
          //     'https://image.tmdb.org/t/p/w500${castModel?.image}',
          //     width: 10,
          //     height: 10,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Text(
            castModel?.name ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            castModel?.character ?? '',
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
