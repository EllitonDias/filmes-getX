import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';
import 'widgets/movie_detail_content/movie_detail_content.dart';
import 'widgets/movie_detail_header.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Detalhe'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(movieDetailModel: controller.movie.value),
              MovieDetailContent(movieDetailModel: controller.movie.value),
            ],
          );
        }),
      ),
    );
  }
}
