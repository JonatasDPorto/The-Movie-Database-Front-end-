import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchPageController(repository: Get.find<TMDBRepository>()));
  }
}
