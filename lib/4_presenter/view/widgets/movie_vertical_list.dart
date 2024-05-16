import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/no_image_widget.dart';

class MovieVerticalList extends StatelessWidget {
  final List<MovieEntity> movies;
  final void Function(MovieEntity movie) onClick;
  const MovieVerticalList({
    super.key,
    required this.movies,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => onClick(movie),
            child: Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: movie.imageURL,
                      width: 140,
                      height: 175,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const NoImageWidget(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${movie.title}\n',
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${movie.releaseDate}\n',
                                  style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 153, 153, 153),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: '${movie.overview}\n',
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
