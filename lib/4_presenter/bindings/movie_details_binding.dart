import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/page_details_controller.dart';

class MovieDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController(repository: Get.find<TMDBRepository>()));
  }
}
