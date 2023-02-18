import 'package:animate_do/animate_do.dart';
import 'package:eventide_app/providers/auth/user_provider.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        Provider.of<UserProvider>(context, listen: false)
            .initializeUser(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.black,
        body: Center(
            child: ElasticIn(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 15),
                color: AppColors.primaryAshThree),
          ],
          color: const Color.fromARGB(255, 231, 71, 71),
        ),
        child: Image.asset(
          '${AssetConstant.imagePath}logoOnly.png',
          width: 50,
          height: 50,
        ),
      ),
    )));
  }
}
