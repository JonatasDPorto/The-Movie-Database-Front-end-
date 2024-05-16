import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/2_infra/model/pagination_movie.dart';
import 'package:the_movie_database_front_end/2_infra/model/person.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_errors.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_execptions.dart';
import 'tmdb_repository_test.mocks.dart';

class TestAllRoutesForError {
  call<E>(TMDBRepository repository) async {
    const movieId = 629374;
    const pageNumber = 1;

    final popularMovies = await repository.popularMovies(pageNumber);
    expect(popularMovies.fold(id, id), isA<E>());

    final recentMovieTrailerURL =
        await repository.recentMovieTrailerURL(movieId);
    expect(recentMovieTrailerURL.fold(id, id), isA<E>());

    final searchMovies = await repository.searchMovies('john', pageNumber);
    expect(searchMovies.fold(id, id), isA<E>());

    final trendingMovies = await repository.trendingMovies(pageNumber);
    expect(trendingMovies.fold(id, id), isA<E>());

    final upcomingMovies = await repository.upcomingMovies(pageNumber);
    expect(upcomingMovies.fold(id, id), isA<E>());
  }
}

class CauseExceptionForAllRoutes {
  final Exception exception;
  CauseExceptionForAllRoutes(this.exception);
  call<E extends Exception>(MockTMDBDatasource datasource) async {
    when(datasource.popularMovies(any)).thenThrow(exception);
    when(datasource.recentMovieTrailerURL(any)).thenThrow(exception);
    when(datasource.searchMovies(any, any)).thenThrow(exception);
    when(datasource.trendingMovies(any)).thenThrow(exception);
    when(datasource.upcomingMovies(any)).thenThrow(exception);
  }
}

@GenerateMocks([TMDBDatasource])
void main() {
  late final MockTMDBDatasource datasource;
  late final TMDBRepository repository;

  const movieId = 629374;
  const pageNumber = 1;

  setUpAll(() {
    datasource = MockTMDBDatasource();
    repository = TMDBRepository(datasource: datasource);
  });

  group("Testes com resposta sem error:", () {
    test("movieCredits - Deve retornar uma lista de Person", () async {
      when(datasource.movieCredits(any)).thenAnswer((_) async => <Person>[]);

      final result = await repository.movieCredits(movieId);

      expect(result.fold(id, id), isA<List<Person>>());
    });

    test("popularMovies - Deve retornar um PaginationMovie", () async {
      when(datasource.popularMovies(any)).thenAnswer((_) async =>
          const PaginationMovie(movies: [], currentPage: 1, totalPages: 1));
      final result = await repository.popularMovies(pageNumber);

      expect(result.fold(id, id), isA<PaginationMovie>());
    });

    test("recentMovieTrailerURL - Deve retornar um PaginationMovie", () async {
      when(datasource.recentMovieTrailerURL(any)).thenAnswer((_) async => '');
      final result = await repository.recentMovieTrailerURL(movieId);

      expect(result.fold(id, id), isA<String>());
    });

    test("searchMovies - Deve retornar um PaginationMovie", () async {
      when(datasource.searchMovies(any, any)).thenAnswer((_) async =>
          const PaginationMovie(movies: [], currentPage: 1, totalPages: 1));
      final result = await repository.searchMovies('john', pageNumber);
      expect(result.fold(id, id), isA<PaginationMovie>());
    });

    test("trendingMovies - Deve retornar um PaginationMovie", () async {
      when(datasource.trendingMovies(any)).thenAnswer((_) async =>
          const PaginationMovie(movies: [], currentPage: 1, totalPages: 1));
      final result = await repository.trendingMovies(pageNumber);
      expect(result.fold(id, id), isA<PaginationMovie>());
    });

    test("upcomingMovies - Deve retornar um PaginationMovie", () async {
      when(datasource.upcomingMovies(any)).thenAnswer((_) async =>
          const PaginationMovie(movies: [], currentPage: 1, totalPages: 1));
      final result = await repository.upcomingMovies(pageNumber);
      expect(result.fold(id, id), isA<PaginationMovie>());
    });
  });

  group("Testes com errors para todas rotas:", () {
    test("Deve retornar um TMDBException (ServiceOfflineException)", () async {
      CauseExceptionForAllRoutes(ServiceOfflineException())(datasource);
      TestAllRoutesForError()<ServiceOfflineError>(repository);
    });

    test("Deve retornar um TMDBException (InternalException)", () async {
      CauseExceptionForAllRoutes(InternalException())(datasource);
      TestAllRoutesForError()<InternalError>(repository);
    });

    test("Deve retornar um TMDBException (TimeoutException)", () async {
      CauseExceptionForAllRoutes(TimeoutException())(datasource);
      TestAllRoutesForError()<TimeoutError>(repository);
    });
  });
}
