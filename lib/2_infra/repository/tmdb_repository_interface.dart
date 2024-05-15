import 'package:either_dart/either.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_errors.dart';

abstract class TMDBRepositoryInterface {
  Future<Either<TMDBError, PaginationMovieEntity>> searchMovies(
    String searchText,
    int pageNumber,
  );
  Future<Either<TMDBError, PaginationMovieEntity>> trendingMovies(
    int pageNumber,
  );
  Future<Either<TMDBError, PaginationMovieEntity>> popularMovies(
    int pageNumber,
  );
  Future<Either<TMDBError, PaginationMovieEntity>> upcomingMovies(
    int pageNumber,
  );
  Future<Either<TMDBError, String>> recentMovieTrailerURL(
    int movieId,
  );

  Future<Either<TMDBError, List<PersonEntity>>> movieCredits(
    int movieId,
  );
}
