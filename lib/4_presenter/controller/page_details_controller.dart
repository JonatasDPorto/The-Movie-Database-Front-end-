// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_database_front_end/1_external/repository/tmdb_repository.dart';
import 'package:the_movie_database_front_end/2_infra/model/movie.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/states/tmdb_states.dart';

class MovieDetailsController extends GetxController {
  final TMDBRepository repository;

  MovieDetailsController({required this.repository}) {
    _getArguments(_readDetails);
  }

  late final Movie movie;

  final RxList<PersonEntity> _persons = <PersonEntity>[].obs;
  List<PersonEntity> get persons => _persons.value;
  final Rx<TMDBState> _personsState = const TMDBState().obs;
  TMDBState get personsState => _personsState.value;

  void _getArguments(VoidCallback callback) {
    try {
      movie = Get.arguments as Movie;
      callback();
    } on Exception {
      _personsState.value = const ErrorState();
    }
  }

  Future<void> _readDetails() async {
    _personsState.value = const StartState();
    _personsState.value = const LoadingState();
    var personsOrError = await repository.movieCredits(movie.id);

    if (personsOrError.isRight) {
      var p = personsOrError.right;
      _persons.addAll(p);
      _personsState.value = const SuccessState();
    } else {
      _personsState.value = const ErrorState();
    }
  }
}
