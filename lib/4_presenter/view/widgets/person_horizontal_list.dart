import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/no_image_widget.dart';
import 'package:the_movie_database_front_end/4_presenter/view/widgets/vanishing_horizontal_scrollable.dart';

class PersonHorizontalList extends StatefulWidget {
  final List<PersonEntity> persons;
  const PersonHorizontalList({
    super.key,
    required this.persons,
  });

  @override
  State<PersonHorizontalList> createState() => _PersonHorizontalListState();
}

class _PersonHorizontalListState extends State<PersonHorizontalList> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) =>
        controller.animateTo(10,
            duration: const Duration(microseconds: 300), curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              'Top Billed Cast',
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          Scrollbar(
            controller: controller,
            trackVisibility: true,
            thumbVisibility: true,
            child: VanishingHorizontalScrollable(
              controller: controller,
              showBackground: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  height: 266,
                  child: ListView.builder(
                    controller: controller,
                    itemCount: widget.persons.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      var person = widget.persons[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: SizedBox(
                            width: 140,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  child: CachedNetworkImage(
                                    imageUrl: person.imageURL,
                                    width: 140,
                                    height: 175,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const NoImageWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                    width: 115,
                                    child: RichText(
                                      maxLines: 3,
                                      text: TextSpan(
                                        text: '${person.name}\n',
                                        style: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: person.characterName,
                                            style: GoogleFonts.sourceSans3(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
