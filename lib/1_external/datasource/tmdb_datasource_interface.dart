import 'package:the_movie_database_front_end/1_external/datasource/interface/datasource_interface.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';

abstract class TMDBDatasourceInterface extends Datasource {
  Future<PaginationMovieEntity> searchMovies(
    String searchText,
    int pageNumber,
  );
  Future<PaginationMovieEntity> trendingMovies(
    int pageNumber,
  );
  Future<PaginationMovieEntity> popularMovies(
    int pageNumber,
  );
  Future<PaginationMovieEntity> upcomingMovies(
    int pageNumber,
  );
  Future<String> recentMovieTrailerURL(
    int movieId,
  );
  Future<List<PersonEntity>> movieCredits(
    int movieId,
  );
}
