// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart';

class PaginationMovie extends PaginationMovieEntity {
  const PaginationMovie({
    required super.movies,
    required super.currentPage,
    required super.totalPages,
  });

  PaginationMovie copyWith({
    List<MovieEntity>? movies,
    int? currentPage,
    int? totalPages,
  }) {
    return PaginationMovie(
      movies: movies ?? super.movies,
      currentPage: currentPage ?? super.currentPage,
      totalPages: totalPages ?? super.totalPages,
    );
  }
}
