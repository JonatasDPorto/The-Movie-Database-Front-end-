import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/3_domain/resources/colors/colors.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  GradientButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 30, 213, 169),
              Color.fromARGB(255, 1, 180, 228)
            ],
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
