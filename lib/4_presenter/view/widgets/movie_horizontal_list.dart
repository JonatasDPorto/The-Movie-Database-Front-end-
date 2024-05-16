import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/user_score.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/vanishing_horizontal_scrollable.dart';

class MovieHorizontalList extends StatefulWidget {
  final String title;
  final List<MovieEntity> movies;
  final bool showBackground;
  final void Function(MovieEntity movie) onClick;
  const MovieHorizontalList({
    super.key,
    required this.movies,
    required this.title,
    required this.onClick,
    this.showBackground = false,
  });

  @override
  State<MovieHorizontalList> createState() => _MovieHorizontalListState();
}

class _MovieHorizontalListState extends State<MovieHorizontalList> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              widget.title,
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          Scrollbar(
            controller: controller,
            child: VanishingHorizontalScrollable(
              controller: controller,
              showBackground: widget.showBackground,
              child: SizedBox(
                height: 379,
                child: ListView.builder(
                  controller: controller,
                  itemCount: widget.movies.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    var movie = widget.movies[index];

                    return GestureDetector(
                      onTap: () => widget.onClick(movie),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 242,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: movie.imageURL,
                                      width: 150,
                                      height: 225,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 30,
                                  child: UserScore(score: movie.popularity),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              width: 115,
                              child: RichText(
                                text: TextSpan(
                                  text: '${movie.title}\n',
                                  style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: movie.releaseDate,
                                      style: GoogleFonts.sourceSans3(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
