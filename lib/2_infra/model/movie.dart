import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';

class Movie extends MovieEntity {
  const Movie(
      {required super.id,
      required super.adult,
      required super.genreIds,
      required super.overview,
      required super.popularity,
      required super.imageURL,
      required super.releaseDate,
      required super.title});

  Movie copyWith({
    int? id,
    bool? adult,
    List<int>? genreIds,
    String? overview,
    double? popularity,
    String? imageURL,
    String? releaseDate,
    String? title,
  }) {
    return Movie(
      id: id ?? super.id,
      adult: adult ?? super.adult,
      genreIds: genreIds ?? super.genreIds,
      overview: overview ?? super.overview,
      popularity: popularity ?? super.popularity,
      imageURL: imageURL ?? super.imageURL,
      releaseDate: releaseDate ?? super.releaseDate,
      title: title ?? super.title,
    );
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    var _imageURL = ((map['poster_path'] as String?) == null)
        ? ''
        : 'https://image.tmdb.org/t/p/w300${map['poster_path']}';
    return Movie(
      id: map['id'] as int,
      adult: map['adult'] as bool,
      genreIds: List<int>.from(map['genre_ids']),
      overview: map['overview'] as String,
      popularity: (map['vote_average'] as double) / 10,
      imageURL: _imageURL,
      releaseDate: map['release_date'] as String,
      title: map['title'] as String,
    );
  }
}
