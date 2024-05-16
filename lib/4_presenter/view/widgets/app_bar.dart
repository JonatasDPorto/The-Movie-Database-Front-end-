import 'package:flutter/material.dart';

class ScaffoldAppBar extends StatelessWidget {
  final Widget body;
  const ScaffoldAppBar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var isMobile = constraints.maxWidth < 900;
        if (isMobile) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 3, 37, 65),
              title: const Image(
                image: AssetImage('assets/images/logo_mobile.png'),
                height: 40,
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: body,
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 3, 37, 65),
            title: const Image(
              image: AssetImage('assets/images/logo_web.png'),
              height: 20,
            ),
            automaticallyImplyLeading: false,
          ),
          body: body,
        );
      },
    );
  }
}
