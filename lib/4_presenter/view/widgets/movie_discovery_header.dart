import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_movie_database_front_end/3_domain/entities/movie_entity.dart';

class MovieDiscoveryHeader extends StatelessWidget {
  final MovieEntity movie;
  const MovieDiscoveryHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(builder: (ctx, constraints) {
          return Stack(
            children: [
              CachedNetworkImage(
                imageUrl: movie.imageURL,
                width: constraints.maxWidth,
                height: 550,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
          );
        }),
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
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
