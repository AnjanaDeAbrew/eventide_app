import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ARCamera extends StatefulWidget {
  const ARCamera({super.key});

  @override
  State<ARCamera> createState() => _ARCameraState();
}

class _ARCameraState extends State<ARCamera> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomText(
        "Profile",
        color: AppColors.black,
      ),
    );
  }
}
