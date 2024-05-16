import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/4_presenter/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(repository: Get.find<TMDBRepository>()));
  }
}
