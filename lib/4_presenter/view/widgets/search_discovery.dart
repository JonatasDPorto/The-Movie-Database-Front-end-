import 'package:flutter/material.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/search_text_field.dart';

class SearchDiscovery extends StatelessWidget {
  final RichText text;
  final String assetImagePath;
  final void Function(String text) onSearch;
  final TextEditingController controller;
  const SearchDiscovery({
    super.key,
    required this.text,
    required this.assetImagePath,
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          Image(
            image: AssetImage(assetImagePath),
            width: width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                SearchTextField(
                  onPressed: onSearch,
                  controller: controller,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
