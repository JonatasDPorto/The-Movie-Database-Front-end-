import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/page_details_controller.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';
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
                  return MovieDetailsHeader(
                    movie: controller.movie,
                    backgroundColor: const Color.fromARGB(255, 3, 37, 65),
                  );
                }
                return const SizedBox();
              },
            ),
            Obx(
              () {
                switch (controller.personsState) {
                  case LoadingState _:
                    return const Center(child: CircularProgressIndicator());
                  case SuccessState _:
                    return PersonHorizontalList(persons: controller.persons);
                  case EmptyState _:
                    return Center(
                      child: Text(
                        'No casts found.',
                        style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    );
                  default:
                    return Center(
                      child: Text(
                        'Something right was wrong :(',
                        style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
