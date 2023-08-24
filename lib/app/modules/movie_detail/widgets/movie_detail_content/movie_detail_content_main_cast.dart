import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/movie_detail_model.dart';
import 'movie_cast.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;
  final showPanel = false.obs;

  MovieDetailContentMainCast({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white70,
        ),
        Obx(() {
          return ExpansionPanelList(
            expandIconColor: Colors.white,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                backgroundColor: Colors.black,
                isExpanded: showPanel.value,
                canTapOnHeader: false,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movieDetailModel?.cast
                            .map(
                              (e) => MovieCast(
                                castModel: e,
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ),
              ),
            ],
          );
        }),
        const Divider(
          color: Colors.white70,
        ),
      ],
    );
  }
}
