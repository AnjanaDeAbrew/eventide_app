import 'dart:ui';

import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/providers/admin/organizer_provider.dart';
import 'package:eventide_app/screens/main/organizer_details/organizer_details.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizerList extends StatefulWidget {
  const OrganizerList({
    Key? key,
  }) : super(key: key);

  @override
  State<OrganizerList> createState() => _OrganizerListState();
}

bool _isClicked = false;

class _OrganizerListState extends State<OrganizerList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrganizerProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.primaryColor,
              )
            : ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        //---first set the product model
                        Provider.of<OrganizerProvider>(context, listen: false)
                            .setOrganizer = value.organizers[index];
                        UtilFunction.navigateTo(
                            context, const OrganizerDetailsPage());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 380,
                        height: 490,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: NetworkImage(value.organizers[index].img),
                              opacity: .7,
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(width: 220),
                                const SizedBox(height: 90),
                                ClipRRect(
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
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    value.organizers[index].orgName,
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
                                        value.organizers[index].town,
                                        fontSize: 17,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: AppColors.white,
                                      ),
                                      const Spacer(),
                                      CustomText(
                                        value.organizers[index].mobile,
                                        fontSize: 14,
                                        color: AppColors.white,
                                      ),
                                      const SizedBox(width: 10)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: value.organizers.length);
      },
    );
  }
}
