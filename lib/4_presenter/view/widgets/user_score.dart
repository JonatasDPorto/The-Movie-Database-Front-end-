import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScore extends StatelessWidget {
  final double score;
  const UserScore({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 34,
          height: 34,
          child: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                value: score,
                strokeWidth: 2,
                color: (score > 0.5)
                    ? Color.lerp(
                        Colors.yellow,
                        Colors.green,
                        score,
                      )
                    : Color.lerp(
                        Colors.red,
                        Colors.yellow,
                        score,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 34,
          height: 34,
          child: Center(
            child: Text(
              (score * 100).toStringAsFixed(0),
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
