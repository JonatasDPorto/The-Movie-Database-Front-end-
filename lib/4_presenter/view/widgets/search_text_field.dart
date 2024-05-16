import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/gradient_button.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w400,
                fontSize: 17.6,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 26.0),
                border: InputBorder.none,
                hintText: 'Pesquisar por um filme...',
                hintStyle: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.6,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          GradientButton(
            text: "Search",
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
