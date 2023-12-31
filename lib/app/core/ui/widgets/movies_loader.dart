import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MoviesLoader extends StatelessWidget {
  const MoviesLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
