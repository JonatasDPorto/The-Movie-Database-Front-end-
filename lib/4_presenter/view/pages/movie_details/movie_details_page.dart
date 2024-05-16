import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/page_details_controller.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/app_bar.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/mobile_movie_details.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/movie_discovery_header.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/person_horizontal_list.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppBar(
        body: Center(
      key: const Key("app_key"),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: ListView(
          children: [
            MovieDiscoveryHeader(movie: controller.movie),
            LayoutBuilder(
              builder: (context, constraints) {
                var isMobile = constraints.maxWidth < 900;
                if (isMobile) {
                  return MobileMovieDetails(movie: controller.movie);
                }
                return const SizedBox();
              },
            ),
            Obx(
              () => PersonHorizontalList(persons: controller.persons),
            ),
          ],
        ),
      ),
    ));
  }
}
