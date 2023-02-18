import 'package:eventide_app/screens/main/category/category_page.dart';
import 'package:eventide_app/screens/main/chat/subScreen/sample.dart';
import 'package:eventide_app/screens/main/favourite/favourite_page.dart';
import 'package:eventide_app/screens/main/home/home_screen.dart';
import 'package:eventide_app/screens/main/profile/profile.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //-------store the active index
  int activeIndex = 0;

  // //----trigger when bottom nav item is clicked
  // void onItemTapped(int val) {
  //   setState(() {
  //     activeIndex = val;
  //   });
  // }

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  //-------screen list
  final List<Widget> _screens = [
    const HomeScreen(),
    const Category(),
    const Favourite(),
    const Profile(),
    const Sample(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: buildNavigator(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: Colors.black54,
                offset: Offset(0.0, 0.75),
              )
            ],
            color: AppColors.bottomColor,
          ),
          height: 75,
          child: GNav(
            gap: 6,
            iconSize: 26,
            curve: Curves.easeInCubic,
            haptic: true,
            tabMargin: const EdgeInsets.symmetric(horizontal: 12),
            tabBorderRadius: 25,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            duration: const Duration(milliseconds: 400),
            textStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: AppColors.white),
            color: AppColors.primaryAshTwo,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.primaryColor,
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.grid_view_rounded,
                text: 'Browse',
              ),
              GButton(
                icon: Icons.favorite_rounded,
                text: 'Favourite',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.camera_alt,
                text: 'AR Cam',
              ),
            ],
            selectedIndex: activeIndex,
            onTabChange: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ));
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[activeIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _screens.elementAt(activeIndex));
      },
    );
  }
}

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar(
//     this.label, {
//     required this.icon,
//     required this.isActive,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);

//   final bool isActive;
//   final String icon;
//   final Function() onTap;
//   final String label;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       onTap: onTap,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image(
//             filterQuality: FilterQuality.high,
//             image: AssetImage(icon),
//             width: 25,
//             color: isActive ? AppColors.black : AppColors.primaryAshTwo,
//           ),
//           const SizedBox(
//             height: 3,
//           ),
//           // CustomText(
//           //   label,
//           //   fontSize: 12,
//           //   color: isActive ? AppColors.black : AppColors.primaryAshTwo,
//           // )
//         ],
//       ),
//     );
//   }
// }
