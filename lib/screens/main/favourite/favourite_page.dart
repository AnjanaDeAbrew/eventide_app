import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/screens/main/drawer/drawer.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Image(
                  image: AssetImage("${AssetConstant.iconPath}menuIcon.png"),
                  color: AppColors.black,
                ),
              );
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 247, 254),
        body: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomText(
                "Favourites",
                color: AppColors.black,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: AppColors.primaryAshTwo,
                                    offset: Offset(2, 3))
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          '${AssetConstant.organizersPath}one.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CustomText(
                                    "Name",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColors.black,
                                  ),
                                  CustomText(
                                    "Location",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  CustomText(
                                    "Mobile",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.red,
                                  ))
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 9),
              )
            ],
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
