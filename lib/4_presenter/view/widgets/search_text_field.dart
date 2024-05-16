// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:the_movie_database_front_end/4_presenter/view/widgets/gradient_button.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String text) onPressed;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
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
              controller: widget.controller,
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
            onPressed: () => widget.onPressed(widget.controller.text),
          )
        ],
      ),
    );
  }
}
