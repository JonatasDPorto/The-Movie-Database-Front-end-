import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/search_controller.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/app_bar.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/movie_vertical_list.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/search_text_field.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppBar(
        body: Center(
      key: const Key("app_key"),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 3, 37, 65),
              padding: const EdgeInsets.all(40.0),
              child: SearchTextField(
                controller: controller.textEditingController,
                onPressed: controller.search,
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  switch (controller.status) {
                    case LoadingState _:
                      return const Center(child: CircularProgressIndicator());
                    case SuccessState _:
                      return MovieVerticalList(
                        movies: controller.moviesPagination.movies,
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
            ),
            Obx(
              () => Center(
                child: Pager(
                  numberButtonSelectedColor:
                      const Color.fromARGB(255, 3, 37, 65),
                  currentPage: controller.moviesPagination.currentPage,
                  totalPages: controller.moviesPagination.totalPages,
                  onPageChanged: controller.goToPage,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
