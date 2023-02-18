import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';

class RelatedOrganizerChat extends StatelessWidget {
  const RelatedOrganizerChat({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 85,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SizedBox(
                width: 70,
                height: 70,
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 30,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(AssetConstant.dummyProfile),
                        radius: 28,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      "Paul",
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemCount: 7),
    );
  }
}
