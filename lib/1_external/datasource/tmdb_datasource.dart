import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource_interface.dart';
import 'package:the_movie_database_front_end/2_infra/model/movie.dart';
import 'package:the_movie_database_front_end/2_infra/model/pagination_movie.dart';
import 'package:the_movie_database_front_end/2_infra/model/person.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';
import 'package:the_movie_database_front_end/3_domain/errors/api_throw_execption.dart';

class TMDBDatasource extends TMDBDatasourceInterface {
  final Dio dio;

  TMDBDatasource({required this.dio});

  @override
  Future<List<PersonEntity>> movieCredits(int movieId) async {
    String apiKey = dotenv.get('TMDB_API_KEY');

    var uri = Uri.https('api.themoviedb.org', '/3/movie/$movieId/credits', {
      'api_key': apiKey,
      'language': 'en-US',
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var cast = result.data['cast'] as List;
        return List<Person>.from(cast.map((e) => Person.fromMap(e)));

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }

  @override
  Future<PaginationMovieEntity> popularMovies(int pageNumber) async {
    String apiKey = dotenv.get('TMDB_API_KEY');

    var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': apiKey,
      'language': 'en-US',
      'page': pageNumber.toString(),
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var results = result.data['results'] as List;
        var movies = List<Movie>.from(results.map((e) => Movie.fromMap(e)));
        var currentPage = result.data['page'] as int;
        var totalPages = result.data['total_pages'] as int;
        return PaginationMovie(
          movies: movies,
          currentPage: currentPage,
          totalPages: totalPages,
        );

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }

  @override
  Future<String> recentMovieTrailerURL(int movieId) async {
    String apiKey = dotenv.get('TMDB_API_KEY');

    var uri = Uri.https('api.themoviedb.org', '/3/movie/$movieId/videos', {
      'api_key': apiKey,
      'language': 'en-US',
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var results = result.data['results'] as List;
        var officialResults = results
            .where((element) =>
                element['official'] && element['site'] == "YouTube")
            .toList();

        officialResults.sort((a, b) => DateTime.parse(a['published_at'])
            .compareTo(DateTime.parse(b['published_at'])));
        var firstTrailer = officialResults.first;
        return 'https://www.youtube.com/watch?v=${firstTrailer['key']}';

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }

  @override
  Future<PaginationMovieEntity> searchMovies(
      String searchText, int pageNumber) async {
    String apiKey = dotenv.get('TMDB_API_KEY');
    var uri = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': apiKey,
      'query': searchText,
      'language': 'en-US',
      'include_adult': 'false',
      'page': pageNumber.toString(),
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var results = result.data['results'] as List;
        var movies = List<Movie>.from(results.map((e) => Movie.fromMap(e)));
        var currentPage = result.data['page'] as int;
        var totalPages = result.data['total_pages'] as int;
        return PaginationMovie(
          movies: movies,
          currentPage: currentPage,
          totalPages: totalPages,
        );

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }

  @override
  Future<PaginationMovieEntity> trendingMovies(int pageNumber) async {
    String apiKey = dotenv.get('TMDB_API_KEY');
    var uri = Uri.https('api.themoviedb.org', '/3/trending/movie/day', {
      'api_key': apiKey,
      'language': 'en-US',
      'page': pageNumber.toString(),
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var results = result.data['results'] as List;
        var movies = List<Movie>.from(results.map((e) => Movie.fromMap(e)));
        var currentPage = result.data['page'] as int;
        var totalPages = result.data['total_pages'] as int;
        return PaginationMovie(
          movies: movies,
          currentPage: currentPage,
          totalPages: totalPages,
        );

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }

  @override
  Future<PaginationMovieEntity> upcomingMovies(int pageNumber) async {
    String apiKey = dotenv.get('TMDB_API_KEY');
    var uri = Uri.https('api.themoviedb.org', '/3/movie/upcoming', {
      'api_key': apiKey,
      'language': 'en-US',
      'page': pageNumber.toString(),
    });

    var result = await dio.get(
      uri.toString(),
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    switch (result.statusCode) {
      case 200:
        var results = result.data['results'] as List;
        var movies = List<Movie>.from(results.map((e) => Movie.fromMap(e)));
        var currentPage = result.data['page'] as int;
        var totalPages = result.data['total_pages'] as int;
        return PaginationMovie(
          movies: movies,
          currentPage: currentPage,
          totalPages: totalPages,
        );

      default:
        ThrowException(result.statusCode ?? 500)();
    }
    throw Exception();
  }
}
