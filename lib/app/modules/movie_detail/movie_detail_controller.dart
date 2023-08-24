import 'package:asyncstate/asyncstate.dart';
import 'package:get/get.dart';

import '../../core/ui/messages/messages_mixin.dart';
import '../../models/message_model.dart';
import '../../models/movie_detail_model.dart';
import '../../services/movies/movies_service.dart';

class MovieDetailController extends GetxController with MessagesMixin {
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  final movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      final movieDetailData =
          await _moviesService.getDetail(movieId).asyncLoader();

      movie.value = movieDetailData;
    } catch (e) {
      _message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao buscar detalhes do filme',
        ),
      );
    }
  }
}
