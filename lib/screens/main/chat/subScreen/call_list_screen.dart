import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';

class CallListScreen extends StatelessWidget {
  const CallListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                height: 85,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(AssetConstant.dummyProfile),
                      radius: 28,
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 300,
                      // color: AppColors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            "James $index",
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 3),
                          const CustomText(
                            "12/01/2022 , 22:10 ",
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                            color: AppColors.primaryAshThree,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone,
                          color: AppColors.primaryColor,
                        ))
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, index) => const Divider(
            height: 0,
            color: AppColors.primaryAshOne,
            endIndent: 22,
            indent: 22),
        itemCount: 20);
  }
}
