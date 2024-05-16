import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/user_score.dart';

class MovieDetailsHeader extends StatelessWidget {
  final Color backgroundColor;
  final MovieEntity movie;
  const MovieDetailsHeader(
      {super.key, required this.movie, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: GoogleFonts.sourceSans3(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserScore(score: movie.popularity),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'User Score',
                  style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Overview',
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.overview.trim().isEmpty
                  ? "No overview for this movie."
                  : movie.overview,
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
