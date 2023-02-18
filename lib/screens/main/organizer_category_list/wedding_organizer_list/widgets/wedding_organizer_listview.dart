import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/providers/admin/organizer_provider.dart';
import 'package:eventide_app/screens/main/organizer_details/organizer_details.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeddingOrganizersList extends StatefulWidget {
  const WeddingOrganizersList({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingOrganizersList> createState() => _WeddingOrganizersListState();
}

class _WeddingOrganizersListState extends State<WeddingOrganizersList> {
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<OrganizerProvider>(
      builder: (context, value, child) {
        return ListView.separated(
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    UtilFunction.navigateTo(
                        context, const OrganizerDetailsPage());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   width: 1,
                        //   color: const Color.fromARGB(255, 221, 221, 221),
                        // ),
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: AppColors.primaryAshTwo,
                              offset: Offset(2, 3))
                        ]),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(value.wedlist[index].img),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                value.wedlist[index].orgName,
                                fontSize: 15,
                                color: AppColors.black,
                                textOverflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              CustomText(value.wedlist[index].mobile,
                                  fontSize: 14,
                                  color: AppColors.primaryAshThree),
                              CustomText(value.wedlist[index].town,
                                  fontSize: 15,
                                  color: AppColors.primaryAshThree),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(.2)),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isClicked = !_isClicked;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: _isClicked
                                      ? AppColors.red
                                      : AppColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const CustomText("4.7",
                                fontSize: 14, color: AppColors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: value.wedlist.length);
      },
    );
  }
}
