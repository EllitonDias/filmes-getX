import '../../services/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../favorites/favorites_bindings.dart';
import '../favorites/favorites_page.dart';
import '../movies/movies_bindings.dart';
import '../movies/movies_page.dart';

class HomeController extends GetxController {
  final LoginService _loginService;

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;

  final _tabIndex = 0.obs;
  final _tabs = [
    '/movies',
    '/favorites',
  ];

  int get tabIndex => _tabIndex.value;

  set tabIndex(int index) {
    _tabIndex(index);
    if (index == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/movies') {
      return GetPageRoute(
        settings: settings,
        page: () => const MoviesPage(),
        binding: MoviesBindings(),
      );
    }
    if (settings.name == '/favorites') {
      return GetPageRoute(
        settings: settings,
        page: () => const FavoritesPage(),
        binding: FavoritesBindings(),
      );
    }

    return null;
  }
}
