import 'dart:ui';

import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/models/organizer_model.dart';
import 'package:eventide_app/screens/main/organizer_details/widgets/related_organizers.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';

class SimilarImages extends StatelessWidget {
  const SimilarImages({required this.organizer, super.key});

  final OrganizerModel organizer;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.black,
            image: DecorationImage(
                image: NetworkImage(organizer.img),
                fit: BoxFit.fill,
                opacity: .7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 25),
                  const SizedBox(height: 90),
                  //---------------arrow back box
                  InkWell(
                    onTap: () {
                      UtilFunction.goBack(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 50),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 90, 107, 134)
                                    .withOpacity(0.5)),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height / 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  'Detail Preview',
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              RelatedOrganizer()
            ],
          ),
        ),
      ),
    );
  }
}
