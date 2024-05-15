import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';

class Person extends PersonEntity {
  const Person({
    required super.name,
    required super.characterName,
    required super.popularity,
    required super.imageURL,
    required super.department,
  });

  Person copyWith({
    String? name,
    String? characterName,
    double? popularity,
    String? imageURL,
    String? department,
  }) {
    return Person(
      name: name ?? super.name,
      characterName: characterName ?? super.characterName,
      popularity: popularity ?? super.popularity,
      imageURL: imageURL ?? super.imageURL,
      department: department ?? super.department,
    );
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      characterName: map['character'] as String,
      popularity: map['popularity'] as double,
      imageURL: 'https://image.tmdb.org/t/p/w300${map['profile_path']}',
      department: map['known_for_department'] as String,
    );
  }
}
