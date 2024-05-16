import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';

class TMDBBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(TMDBDatasource(dio: Get.find<Dio>()));
    Get.put(TMDBRepository(datasource: Get.find<TMDBDatasource>()));
  }
}
