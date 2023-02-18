import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/components/search_auto_complete.dart';
import 'package:eventide_app/providers/auth/user_provider.dart';
import 'package:eventide_app/screens/main/drawer/drawer.dart';
import 'package:eventide_app/screens/main/favourite/favourite_page.dart';
import 'package:eventide_app/screens/main/home/widgets/home_organizer_list.dart';
import 'package:eventide_app/screens/main/home/widgets/home_related_category.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // body: NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) {
        //     return [
        //       createSilverAppBar1(context),
        // //     ];
        //   },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(child: Consumer<UserProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Builder(builder: (context) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: value.isLoading
                                ? const CircularProgressIndicator.adaptive(
                                    backgroundColor: AppColors.primaryColor,
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(value.userModel!.img),
                                    radius: 30,
                                  ),
                          );
                        }),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText("Welcome",
                                color: AppColors.primaryAshTwo, fontSize: 15),
                            CustomText(
                              value.userModel!.name,
                              color: AppColors.black,
                              fontSize: 22,
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 225, 225, 225),
                          ),
                          child: IconButton(
                              onPressed: () {
                                UtilFunction.navigateTo(
                                    context, const Favourite());
                              },
                              icon: const Icon(
                                Icons.notifications_rounded,
                                color: AppColors.black,
                                size: 28,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomSearchBar("Search here"),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: size.width,
                    height: 85,
                    child: HomePageRelatedCategory(),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: size.width,
                    height: 490,
                    child: const OrganizerList(),
                  )
                ],
              );
            },
          )),
        ),
        drawer: const CustomDrawer(),
      ),

      // ),
    );
  }

  // SliverAppBar createSilverAppBar1(BuildContext context) {
  //   return SliverAppBar(
  //     // backgroundColor: Colors.redAccent,
  //     expandedHeight: 80,
  //     floating: false,
  //     elevation: 0,
  //     backgroundColor: Colors.transparent,
  //     leading: Builder(
  //       builder: (BuildContext context) {
  //         return Padding(
  //           padding: const EdgeInsets.only(top: 12, left: 8),
  //       child: InkWell(
  //         splashColor: Colors.transparent,
  //         highlightColor: Colors.transparent,
  //         onTap: () {
  //           Scaffold.of(context).openDrawer();
  //         },
  //         child: const CircleAvatar(
  //           backgroundImage: NetworkImage(AssetConstant.dummyProfile),
  //           radius: 22,
  //         ),
  //       ),
  //     );
  //   }
  // )
  //     title: Padding(
  //       padding: const EdgeInsets.only(top: 14),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: const [
  //           CustomText("Welcome", color: AppColors.primaryAshTwo, fontSize: 15),
  //           CustomText(
  //             "Sean Paul",
  //             color: AppColors.black,
  //             fontSize: 22,
  //           )
  //         ],
  //       ),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 10, right: 10),
  //         child: Container(
  //           width: 45,
  //           height: 50,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: const Color.fromARGB(255, 225, 225, 225),
  //           ),
  //           child: IconButton(
  //               onPressed: () {
  //                 UtilFunction.navigateTo(context, const Favourite());
  //               },
  //               icon: const Icon(
  //                 Icons.notifications_rounded,
  //                 color: AppColors.black,
  //                 size: 28,
  //               )),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
