import 'dart:convert';
import 'package:the_movie_database_front_end/3_domain/entities/movie_details_entity.dart';

class MovieDetails extends MovieDetailsEntity {
  const MovieDetails({
    required super.adult,
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.imdbId,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  MovieDetails copyWith({
    bool? adult,
    String? backdropPath,
    List<String>? genres,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<String>? productionCompanies,
    List<String>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetails(
      adult: adult ?? super.adult,
      backdropPath: backdropPath ?? super.backdropPath,
      genres: genres ?? super.genres,
      id: id ?? super.id,
      imdbId: imdbId ?? super.imdbId,
      originCountry: originCountry ?? super.originCountry,
      originalLanguage: originalLanguage ?? super.originalLanguage,
      originalTitle: originalTitle ?? super.originalTitle,
      overview: overview ?? super.overview,
      popularity: popularity ?? super.popularity,
      posterPath: posterPath ?? super.posterPath,
      productionCompanies: productionCompanies ?? super.productionCompanies,
      productionCountries: productionCountries ?? super.productionCountries,
      releaseDate: releaseDate ?? super.releaseDate,
      revenue: revenue ?? super.revenue,
      runtime: runtime ?? super.runtime,
      status: status ?? super.status,
      tagline: tagline ?? super.tagline,
      title: title ?? super.title,
      video: video ?? super.video,
      voteAverage: voteAverage ?? super.voteAverage,
      voteCount: voteCount ?? super.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'genres': genres,
      'id': id,
      'imdbId': imdbId,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies,
      'productionCountries': productionCountries,
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
    return MovieDetails(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'],
      genres: (map['genres'] as List<dynamic>?)
              ?.map((genre) => genre.toString())
              .toList() ??
          [],
      id: map['id'] ?? 0,
      imdbId: map['imdb_id'] ?? '',
      originCountry: (map['origin_country'] as List<dynamic>?)
              ?.map((country) => country.toString())
              .toList() ??
          [],
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity'] ?? 0.0,
      posterPath: map['poster_path'],
      productionCompanies: (map['production_companies'] as List<dynamic>?)
              ?.map((company) => company['name'].toString())
              .toList() ??
          [],
      productionCountries: (map['production_countries'] as List<dynamic>?)
              ?.map((country) => country['name'].toString())
              .toList() ??
          [],
      releaseDate: map['release_date'] ?? '',
      revenue: map['revenue'] ?? 0,
      runtime: map['runtime'] ?? 0,
      status: map['status'] ?? '',
      tagline: map['tagline'],
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average'] ?? 0.0,
      voteCount: map['vote_count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetails.fromJson(String source) =>
      MovieDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
