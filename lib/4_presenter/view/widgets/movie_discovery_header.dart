import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/mobile_movie_details.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/no_image_widget.dart';

class MovieDiscoveryHeader extends StatelessWidget {
  final MovieEntity movie;
  const MovieDiscoveryHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      var isMobile = constraints.maxWidth < 900;
      return Stack(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: movie.imageURL,
                width: constraints.maxWidth,
                height: 550,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const NoImageWidget(),
              ),
              Container(
                width: constraints.maxWidth,
                height: 550,
                color: const Color.fromARGB(200, 3, 37, 65),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                blendMode: BlendMode.color,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 50,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: CachedNetworkImage(
                  imageUrl: movie.imageURL,
                  width: 300,
                  height: 450,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const NoImageWidget()),
            ),
          ),
          if (!isMobile)
            Positioned(
              top: 50,
              left: 400,
              child: SizedBox(
                height: 450,
                width: constraints.maxWidth - 450,
                child: MovieDetailsHeader(
                  movie: movie,
                  backgroundColor: const Color.fromARGB(0, 3, 37, 65),
                ),
              ),
            ),
        ],
      );
    });
  }
}
