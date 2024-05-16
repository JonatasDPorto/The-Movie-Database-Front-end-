// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/routes/app_routes.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';

class HomeController extends GetxController {
  final TMDBRepository repository;

  HomeController({required this.repository}) {
    _readTrending();
    _readPopular();
  }
  final TextEditingController textEditingController = TextEditingController();

  final RxList<MovieEntity> _trendingMovies = <MovieEntity>[].obs;
  List<MovieEntity> get trendingMovies => _trendingMovies.value;
  final Rx<TMDBState> _trendingMoviesState = const TMDBState().obs;
  TMDBState get trendingMoviesState => _trendingMoviesState.value;

  final RxList<MovieEntity> _popularMovies = <MovieEntity>[].obs;
  List<MovieEntity> get popularMovies => _popularMovies.value;
  final Rx<TMDBState> _popularMoviesState = const TMDBState().obs;
  TMDBState get popularState => _popularMoviesState.value;

  Future<void> _readTrending() async {
    _trendingMoviesState.value = const StartState();
    _trendingMoviesState.value = const LoadingState();
    var paginationOrError = await repository.trendingMovies(1);

    if (paginationOrError.isRight) {
      var movies = paginationOrError.right.movies;
      _trendingMovies.addAll(movies);
      if (movies.isEmpty) {
        _trendingMoviesState.value = const EmptyState();
      } else {
        _trendingMoviesState.value = const SuccessState();
      }
    } else {
      _trendingMoviesState.value = const ErrorState();
    }
  }

  Future<void> _readPopular() async {
    _popularMoviesState.value = const StartState();
    _popularMoviesState.value = const LoadingState();
    var paginationOrError = await repository.popularMovies(1);

    if (paginationOrError.isRight) {
      var movies = paginationOrError.right.movies;
      _popularMovies.addAll(movies);
      if (movies.isEmpty) {
        _popularMoviesState.value = const EmptyState();
      } else {
        _popularMoviesState.value = const SuccessState();
      }
    } else {
      _popularMoviesState.value = const ErrorState();
    }
  }

  void openMovieDetailsPage(MovieEntity movie) {
    Get.toNamed(Routes.MOVIE_DETAILS, arguments: movie);
  }

  void openSearchPage(String text) {
    if (text.trim().isEmpty) return;
    Get.toNamed(Routes.SEARCH, arguments: text);
  }
}
