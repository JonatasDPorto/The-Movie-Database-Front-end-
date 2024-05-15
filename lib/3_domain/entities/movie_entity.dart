import 'package:equatable/equatable.dart';

abstract class MovieEntity extends Equatable {
  final int id;
  final bool adult;
  final List<int> genreIds;
  final String overview;
  final double popularity;
  final String? imageURL;
  final String releaseDate;
  final String title;

  const MovieEntity({
    required this.id,
    required this.adult,
    required this.imageURL,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.genreIds,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
    ];
  }

  @override
  bool get stringify => true;
}
