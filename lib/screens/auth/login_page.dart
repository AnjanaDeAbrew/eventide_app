import 'package:animate_do/animate_do.dart';
import 'package:eventide_app/components/custom_button.dart';
import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/components/custom_textfield.dart';
import 'package:eventide_app/components/privact_text.dart';
import 'package:eventide_app/components/social_button.dart';
import 'package:eventide_app/providers/auth/login_provider.dart';
import 'package:eventide_app/screens/auth/forgotpassword_page.dart';
import 'package:eventide_app/screens/auth/signup_page.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            "Welcome,",
                            color: AppColors.black,
                          ),
                          SizedBox(height: 30),
                          CustomText(
                            "Login to\na joyful\nlife",
                            fontSize: 32,
                            color: AppColors.black,
                            textAlign: TextAlign.justify,
                          )
                        ]),
                    Image.asset(
                      "${AssetConstant.imagePath}login.png",
                    )
                  ],
                ),
                const SizedBox(height: 40),
                const CustomText("Enter your Email",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textLabelAsh),
                const SizedBox(height: 4),
                CustomTextfield(
                  controller:
                      Provider.of<LoginProvider>(context).emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 6),
                const CustomText("Enter your Password",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textLabelAsh),
                const SizedBox(height: 4),
                CustomTextfield(
                  controller:
                      Provider.of<LoginProvider>(context).passwordController,
                  isObsecure: true,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      UtilFunction.navigateTo(
                          context,
                          FadeInRight(
                              duration: const Duration(milliseconds: 300),
                              child: const ForogotPassword()));
                    },
                    child: const CustomText("Forgot your password ?",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Center(child: Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return CustomButton(isLoading: value.isLoading, "Login",
                        onTap: () {
                      value.startSignIn(context);
                    });
                  },
                )),
                const SizedBox(height: 21),
                orTextRow(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                        onTap: () {},
                        iconPath: '${AssetConstant.imagePath}google.png',
                        color: const Color(0xffFF3D00)),
                    const SizedBox(width: 16),
                    SocialButton(
                        onTap: () {},
                        iconPath: '${AssetConstant.imagePath}fb.png',
                        color: const Color(0xff1976D2))
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                      UtilFunction.navigateTo(context, const SignupPage());
                    },
                    child: const CustomText("Don't have an account?",
                        fontSize: 15,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 26),
                const PrivactText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row orTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 65,
          height: 1,
          color: AppColors.primaryAshTwo,
        ),
        const SizedBox(width: 10),
        //-------widget for -or- text
        const CustomText("Or",
            fontSize: 12,
            color: AppColors.primaryAshThree,
            fontWeight: FontWeight.normal),
        const SizedBox(width: 10),
        Container(
          width: 65,
          height: 1,
          color: AppColors.primaryAshTwo,
        ),
      ],
    );
  }
}
