import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/models/category_model.dart';
import 'package:eventide_app/screens/main/organizer_category_list/office_organizer_list/widgets/office_organizer_listview.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';

class OfficeList extends StatefulWidget {
  const OfficeList({required this.categoryModel, super.key});
  final CategoryModel categoryModel;

  @override
  State<OfficeList> createState() => _OfficeListState();
}

class _OfficeListState extends State<OfficeList> {
  var _isClicked = false;
  // var _isColorChange = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: size.width,
                height: 160,
                color: AppColors.organizerPageColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            UtilFunction.goBack(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const SizedBox(height: 30),
                        CustomText(
                          widget.categoryModel.category,
                          fontSize: 32,
                          color: const Color(0xff524E4E),
                        )
                      ],
                    ),
                    Image.asset(
                        "${AssetConstant.organierVectorPath}${widget.categoryModel.vectorImage}")
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CustomText(
                      "Results : ",
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 250),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isClicked = !_isClicked;
                          // _isColorChange=!_isColorChange;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: _isClicked
                                ? AppColors.black
                                : AppColors.primaryAshOne,
                            // color: const Color(0xffEDEDED),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              "Sort",
                              fontSize: 16,
                              color: _isClicked
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined,
                                color: _isClicked
                                    ? AppColors.white
                                    : AppColors.black)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(child: OfficeOrganizersList()),
            ],
          ),
        ),
      ),
    );
  }
}
