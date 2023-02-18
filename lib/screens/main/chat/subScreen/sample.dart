import 'package:eventide_app/components/custom_searchbar.dart';
import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/screens/main/chat/subScreen/call_list_screen.dart';
import 'package:eventide_app/screens/main/chat/subScreen/chat_list_screen.dart';
import 'package:eventide_app/screens/main/chat/widgets/related_organizers_chat.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              createSilverAppBar1(context),
            ];
          },
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: const [
                TabBar(
                  labelColor: AppColors.black,
                  indicatorColor: AppColors.primaryColor,
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 4, color: Color(0xff4d3f5c)),
                    insets: EdgeInsets.symmetric(horizontal: 60.0),
                  ),
                  unselectedLabelColor: Color(0xff9f9aad),
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  tabs: [
                    Tab(text: 'Chats'),
                    Tab(text: 'Calls'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ChatListScreen(),
                      CallListScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SliverAppBar createSilverAppBar1(BuildContext context) {
  final search = TextEditingController();
  return SliverAppBar(
    // backgroundColor: Colors.redAccent,
    expandedHeight: 300,
    floating: false,
    elevation: 0,
    backgroundColor: const Color(0xfff0f5ff),

    flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      UtilFunction.goBack(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const CustomText(
                    'Chat',
                    fontSize: 30,
                    color: AppColors.black,
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(AssetConstant.dummyProfile),
                    radius: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomSearchBar2("Search",
                  controller: search,
                  color: const Color.fromARGB(255, 248, 248, 248)),
            ),
            const SizedBox(height: 20),
            const RelatedOrganizerChat(),
          ],
        ),
      );
    }),
  );
}
