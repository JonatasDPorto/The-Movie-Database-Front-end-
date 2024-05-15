import 'package:either_dart/either.dart';
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource_interface.dart';
import 'package:the_movie_database_front_end/2_infra/repository/tmdb_repository_interface.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_errors.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_execptions.dart';

class TMDBRepository extends TMDBRepositoryInterface {
  final TMDBDatasourceInterface datasource;

  TMDBRepository({required this.datasource});

  @override
  Future<Either<TMDBError, PaginationMovieEntity>> searchMovies(
    String searchText,
    int pageNumber,
  ) async {
    try {
      PaginationMovieEntity col =
          await datasource.searchMovies(searchText, pageNumber);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<TMDBError, PaginationMovieEntity>> trendingMovies(
    int pageNumber,
  ) async {
    try {
      PaginationMovieEntity col = await datasource.trendingMovies(pageNumber);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<TMDBError, PaginationMovieEntity>> popularMovies(
    int pageNumber,
  ) async {
    try {
      PaginationMovieEntity col = await datasource.popularMovies(pageNumber);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<TMDBError, PaginationMovieEntity>> upcomingMovies(
    int pageNumber,
  ) async {
    try {
      PaginationMovieEntity col = await datasource.upcomingMovies(pageNumber);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<TMDBError, String>> recentMovieTrailerURL(
    int movieId,
  ) async {
    try {
      String col = await datasource.recentMovieTrailerURL(movieId);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<TMDBError, List<PersonEntity>>> movieCredits(
    int movieId,
  ) async {
    try {
      List<PersonEntity> col = await datasource.movieCredits(movieId);
      return Right(col);
    } on TMDBException catch (e) {
      return Left(e.type);
    }
  }
}
