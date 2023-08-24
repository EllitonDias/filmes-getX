import 'package:flutter/material.dart';

import '../../../models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel genreModel;
  final bool _selected;
  final VoidCallback onPressed;

  const FilterTag({
    super.key,
    required this.genreModel,
    bool selected = false,
    required this.onPressed,
  }) : _selected = selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 26,
        ),
        decoration: BoxDecoration(
          color: _selected ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            genreModel.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: _selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
