// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';

abstract class PaginationMovieEntity extends Equatable {
  final List<MovieEntity> movies;
  final int currentPage;
  final int totalPages;

  const PaginationMovieEntity({
    required this.movies,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [currentPage, totalPages];

  @override
  bool get stringify => true;
}
