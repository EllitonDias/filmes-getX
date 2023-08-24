import 'core/bindings/app_bindings.dart';
import 'core/ui/movies_theme.dart';
import 'core/ui/widgets/movies_loader.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/movie_detail/movie_detail_module.dart';
import 'modules/splash/splash_module.dart';
import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const MoviesLoader(),
      builder: (asyncNavigatorObserver) {
        return GetMaterialApp(
          title: MoviesTheme.title,
          theme: MoviesTheme.themeData,
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          navigatorObservers: [asyncNavigatorObserver],
          getPages: [
            ...SplashModule().routers,
            ...LoginModule().routers,
            ...HomeModule().routers,
            ...MovieDetailModule().routers,
          ],
        );
      },
    );
  }
}
