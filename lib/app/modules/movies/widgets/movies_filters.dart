import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';
import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () {
            return Row(
              children: controller.genres
                  .map(
                    (g) => FilterTag(
                      selected: controller.genreSelected.value?.id == g.id,
                      genreModel: g,
                      onPressed: () => controller.filterMoviesByGenre(g),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
