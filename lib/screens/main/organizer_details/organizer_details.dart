import 'dart:ui';

import 'package:eventide_app/components/custom_button.dart';
import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/providers/admin/organizer_provider.dart';
import 'package:eventide_app/screens/main/book/booking_page.dart';
import 'package:eventide_app/screens/main/organizer_details/widgets/similarImages.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/related_organizers.dart';

class OrganizerDetailsPage extends StatefulWidget {
  const OrganizerDetailsPage({super.key});

  @override
  State<OrganizerDetailsPage> createState() => _OrganizerDetailsPageState();
}

double _rating = 2.0;
int count = 0;
bool _isClicked = false;

class _OrganizerDetailsPageState extends State<OrganizerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: Consumer<OrganizerProvider>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //----------------image with details
                InkWell(
                  onTap: () {
                    UtilFunction.navigateTo(
                        context,
                        SimilarImages(
                          organizer: value.organizerModel,
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 40),
                    height: 570,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 8,
                            offset: Offset(2, 9),
                            color: AppColors.primaryAshThree)
                      ],
                      image: DecorationImage(
                          image: NetworkImage(value.organizerModel.img),
                          opacity: .7,
                          fit: BoxFit.cover),
                    ),
                    child: Column(
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
                                    filter: ImageFilter.blur(
                                        sigmaX: 40, sigmaY: 50),
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                                  255, 90, 107, 134)
                                              .withOpacity(0.5)),
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: AppColors.white,
                                      ),
                                    )),
                              ),
                            ),
                            //------------favourite icon
                            const Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 40, sigmaY: 50),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                                255, 90, 107, 134)
                                            .withOpacity(0.5)),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isClicked = !_isClicked;
                                        });
                                      },
                                      icon: _isClicked
                                          ? Image.asset(
                                              AssetConstant.heartFillPath)
                                          : Image.asset(AssetConstant.hpth,
                                              width: 25,
                                              height: 25,
                                              color: AppColors.white),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 25),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                value.organizerModel.orgName,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.white,
                                  ),
                                  CustomText(
                                    value.organizerModel.town,
                                    fontSize: 17,
                                    textOverflow: TextOverflow.ellipsis,
                                    color: AppColors.white,
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    value.organizerModel.mobile,
                                    fontSize: 14,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 30)
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //-----------------rating bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      RatingBar(
                        glow: true,
                        itemSize: 26,
                        glowColor: Colors.amber,
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.amber),
                            half: const Icon(Icons.star_half,
                                color: Colors.amber),
                            empty: const Icon(Icons.star_outline,
                                color: Colors.amber)),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                            count++;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        '$_rating',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        '($count)',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
                //---------------------------------details of organizer
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomText(
                    "Descrption",
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomText(
                    value.organizerModel.description,
                    color: AppColors.primaryAshThree,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomText(
                    "Details",
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          color: AppColors.primaryAshThree),
                      const SizedBox(width: 20),
                      CustomText(
                        "${value.organizerModel.streetNo}, ${value.organizerModel.streetName}, ${value.organizerModel.town}",
                        color: AppColors.primaryAshThree,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.phone_outlined,
                          color: AppColors.primaryAshThree),
                      const SizedBox(width: 20),
                      CustomText(
                        value.organizerModel.mobile,
                        color: AppColors.primaryAshThree,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.attach_money_rounded,
                          color: AppColors.primaryAshThree),
                      const SizedBox(width: 20),
                      CustomText(
                        value.organizerModel.price,
                        color: AppColors.primaryAshThree,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),

                //--------------related organizers
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomText(
                    'Related organizers',
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),

                //------button
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RelatedOrganizer(),
                ),
                const SizedBox(height: 40),
                Center(
                  child: CustomButton(
                    "Book Now",
                    color: AppColors.bottomColor,
                    height: 65,
                    width: 400,
                    onTap: () {
                      UtilFunction.navigateTo(context, const BookingPage());
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        )),
      ),
    );
  }
}
