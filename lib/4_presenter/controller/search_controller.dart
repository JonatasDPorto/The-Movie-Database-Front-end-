import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/2_infra/model/pagination_movie.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/routes/app_routes.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';

class SearchPageController extends GetxController {
  final TMDBRepository repository;

  SearchPageController({required this.repository}) {
    _getArguments(_searchText);
  }

  final Rx<int> _currentPage = 1.obs;
  int get currentPage => _currentPage.value;

  final Rx<PaginationMovieEntity> _pagination = const PaginationMovie(
    currentPage: 1,
    movies: [],
    totalPages: 1,
  ).obs;

  PaginationMovieEntity get moviesPagination => _pagination.value;

  final Rx<TMDBState> _status = const TMDBState().obs;
  TMDBState get status => _status.value;

  final TextEditingController textEditingController = TextEditingController();

  void _getArguments(VoidCallback callback) {
    try {
      textEditingController.text = Get.arguments as String;
      callback();
    } on Exception {
      _status.value = const ErrorState();
    }
  }

  Future<void> _searchText() async {
    _status.value = const StartState();
    _status.value = const LoadingState();
    var paginationOrError =
        await repository.searchMovies(textEditingController.text, currentPage);

    if (paginationOrError.isRight) {
      var pagination = paginationOrError.right;
      _pagination.value = pagination;
      if (pagination.movies.isEmpty) {
        _status.value = const EmptyState();
      } else {
        _status.value = const SuccessState();
      }
    } else {
      _status.value = const ErrorState();
    }
  }

  void search(String text) {
    if (text.trim().isEmpty) {
      return;
    }
    textEditingController.text = text;
    _searchText();
  }

  void goToPage(int page) {
    _currentPage.value = page;
    _searchText();
  }

  void openMovieDetailsPage(MovieEntity movie) {
    Get.toNamed(Routes.MOVIE_DETAILS, arguments: movie);
  }
}
