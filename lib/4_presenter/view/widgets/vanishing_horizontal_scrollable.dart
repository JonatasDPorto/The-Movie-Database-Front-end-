import 'package:flutter/material.dart';

class VanishingHorizontalScrollable extends StatelessWidget {
  final ScrollController controller;
  final Widget child;
  final bool showBackground;
  const VanishingHorizontalScrollable({
    super.key,
    required this.controller,
    required this.child,
    required this.showBackground,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: const Image(
        image: AssetImage('assets/images/trending_bg.png'),
      ),
      builder: (context, c) {
        if (!controller.hasClients) {
          return child;
        }
        var isVisible = controller.offset < 100;
        return Stack(
          children: [
            if (c != null && showBackground)
              Positioned(
                bottom: 0,
                child: c,
              ),
            child,
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white.withOpacity(0), Colors.white],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
