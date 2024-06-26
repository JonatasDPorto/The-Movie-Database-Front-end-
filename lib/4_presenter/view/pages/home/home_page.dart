import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/home_controller.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';

import 'package:the_movie_database_front_end/4_presenter/view/widgets/app_bar.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/movie_horizontal_list.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/search_discovery.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppBar(
        body: Center(
      key: const Key("app_key"),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: ListView(
          children: [
            SearchDiscovery(
              controller: controller.textEditingController,
              text: RichText(
                text: TextSpan(
                  text: 'Welcome.\n',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Millions of movies, TV shows and people to discover. Explore now.',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              assetImagePath: 'assets/images/home_discovery.jpg',
              onSearch: controller.openSearchPage,
            ),
            Obx(
              () {
                switch (controller.trendingMoviesState) {
                  case LoadingState _:
                    return const Center(child: CircularProgressIndicator());
                  case SuccessState _:
                    return MovieHorizontalList(
                      title: "Trending",
                      movies: controller.trendingMovies,
                      showBackground: true,
                      onClick: controller.openMovieDetailsPage,
                    );
                  case EmptyState _:
                    return Center(
                      child: Text(
                        'Nothing was found.',
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
            Obx(
              () {
                switch (controller.popularState) {
                  case LoadingState _:
                    return const Center(child: CircularProgressIndicator());
                  case SuccessState _:
                    return MovieHorizontalList(
                      title: "What's Popular",
                      movies: controller.popularMovies,
                      onClick: controller.openMovieDetailsPage,
                    );
                  case EmptyState _:
                    return Center(
                      child: Text(
                        'Nothing was found.',
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
