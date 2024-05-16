import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:the_movie_database_front_end/4_presenter/bindings/tmdb_binding.dart';
import 'package:the_movie_database_front_end/4_presenter/routes/app_pages.dart';
import 'package:the_movie_database_front_end/4_presenter/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    themeMode: ThemeMode.dark,
    defaultTransition: Transition.fade,
    initialBinding: TMDBBinding(),
    getPages: AppPages.pages,
  ));
}
