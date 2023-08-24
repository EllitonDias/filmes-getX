import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white, width: 0.5),
              ),
            ),
            child: BottomNavigationBar(
              onTap: (value) => controller.tabIndex = value,
              currentIndex: controller.tabIndex,
              items: const [
                BottomNavigationBarItem(
                  label: 'Filmes',
                  icon: Icon(Icons.movie),
                ),
                BottomNavigationBarItem(
                  label: 'Favoritos',
                  icon: Icon(Icons.favorite_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'Sair',
                  icon: Icon(Icons.logout_outlined),
                ),
              ],
            ),
          );
        },
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
