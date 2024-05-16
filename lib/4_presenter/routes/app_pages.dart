import 'package:get/get.dart';
import 'package:the_movie_database_front_end/4_presenter/bindings/home_binding.dart';
import 'package:the_movie_database_front_end/4_presenter/bindings/movie_details_binding.dart';
import 'package:the_movie_database_front_end/4_presenter/view/pages/home/home_page.dart';
import 'package:the_movie_database_front_end/4_presenter/view/pages/movie_details/movie_details_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: Routes.MOVIE_DETAILS,
      page: () => const MovieDetailsPage(),
      bindings: [
        MovieDetailsBinding(),
      ],
    ),
  ];
}
