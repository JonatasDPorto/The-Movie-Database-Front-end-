// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class PersonEntity extends Equatable {
  final String name;
  final String characterName;
  final double popularity;
  final String imageURL;
  final String department;

  const PersonEntity({
    required this.name,
    required this.characterName,
    required this.popularity,
    required this.imageURL,
    required this.department,
  });

  @override
  List<Object> get props {
    return [
      name,
      characterName,
      popularity,
      imageURL,
      department,
    ];
  }

  @override
  bool get stringify => true;
}
