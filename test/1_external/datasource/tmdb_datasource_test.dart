import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource.dart';
import 'package:the_movie_database_front_end/2_infra/model/pagination_movie.dart';
import 'package:the_movie_database_front_end/2_infra/model/person.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_execptions.dart';
import 'reponses/tmdb_popular_response.dart';
import 'reponses/tmdb_recent_trailer_reponse.dart';
import 'reponses/tmdb_trending_response.dart';
import 'reponses/tmdb_upcoming_response.dart';
import 'tmdb_datasource_test.mocks.dart';
import 'reponses/tmdb_movie_credits_response.dart';
import 'reponses/tmdb_search_response.dart';

class TestAllRoutesForExceptoion {
  call<E>(TMDBDatasource datasource) {
    const movieId = 629374;
    const pageNumber = 1;

    final movieCredits = datasource.movieCredits(movieId);
    expect(movieCredits, throwsA(isA<E>()));

    final popularMovies = datasource.popularMovies(pageNumber);
    expect(popularMovies, throwsA(isA<E>()));

    final recentMovieTrailerURL = datasource.recentMovieTrailerURL(movieId);
    expect(recentMovieTrailerURL, throwsA(isA<E>()));

    final searchMovies = datasource.searchMovies('john', pageNumber);
    expect(searchMovies, throwsA(isA<E>()));

    final trendingMovies = datasource.trendingMovies(pageNumber);
    expect(trendingMovies, throwsA(isA<E>()));

    final upcomingMovies = datasource.upcomingMovies(pageNumber);
    expect(upcomingMovies, throwsA(isA<E>()));
  }
}

@GenerateMocks([Dio])
void main() {
  late final MockDio dio;
  late final TMDBDatasource datasource;

  const movieId = 629374;
  const pageNumber = 1;

  setUpAll(() {
    dio = MockDio();
    datasource = TMDBDatasource(dio: dio);
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
  });

  group("Testes com resposta sem error:", () {
    test("movieCredits - Deve retornar uma lista de Person", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: movieCreditsResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.movieCredits(movieId);

      expect(future, completes);
      expect(await future, isA<List<Person>>());
    });

    test("popularMovies - Deve retornar um PaginationMovie", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: popularMoviesResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.popularMovies(pageNumber);

      expect(future, completes);
      expect(await future, isA<PaginationMovie>());
    });

    test("recentMovieTrailerURL - Deve retornar um PaginationMovie", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: recentMovieTrailerURLResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.recentMovieTrailerURL(movieId);

      expect(future, completes);
      expect(await future, isA<String>());
    });

    test("searchMovies - Deve retornar um PaginationMovie", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: searchResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.searchMovies('john', pageNumber);

      expect(future, completes);
      expect(await future, isA<PaginationMovie>());
    });

    test("trendingMovies - Deve retornar um PaginationMovie", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: trendingMoviesResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.trendingMovies(pageNumber);

      expect(future, completes);
      expect(await future, isA<PaginationMovie>());
    });

    test("upcomingMovies - Deve retornar um PaginationMovie", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: upcomingMoviesResponse,
          statusCode: 200,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      final future = datasource.upcomingMovies(pageNumber);

      expect(future, completes);
      expect(await future, isA<PaginationMovie>());
    });
  });

  group("Testes com errors para todas rotas:", () {
    test("Deve retornar um TMDBException (ServiceOfflineException)", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 503,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      TestAllRoutesForExceptoion()<ServiceOfflineException>(datasource);
    });

    test("Deve retornar um TMDBException (InternalException)", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 500,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      TestAllRoutesForExceptoion()<InternalException>(datasource);
    });

    test("Deve retornar um TMDBException (TimeoutException)", () async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 504,
          requestOptions: RequestOptions(
            validateStatus: (status) => true,
          ),
        ),
      );
      TestAllRoutesForExceptoion()<TimeoutException>(datasource);
    });
  });
}
