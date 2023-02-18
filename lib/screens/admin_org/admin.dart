import 'dart:ui';

import 'package:eventide_app/components/custom_button.dart';
import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/providers/admin/admin_provider.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../components/admin_custom_textfield.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 96),
              InkWell(
                onTap: () {
                  UtilFunction.goBack(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 50),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 90, 107, 134)
                                .withOpacity(0.5)),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                      )),
                ),
              ),
              const CustomText('Admin - Save product info',
                  color: AppColors.black, fontSize: 20),
              const SizedBox(height: 41),
              Consumer<AdminProvider>(
                builder: (context, value, child) {
                  return value.image.path == ""
                      ? IconButton(
                          onPressed: () => value.selectImage(),
                          icon: const Icon(
                            Icons.image,
                            size: 60,
                          ),
                        )
                      : InkWell(
                          onTap: () => value.selectImage(),
                          child: Image.file(
                            value.image,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        );
                },
              ),
              const SizedBox(height: 20),
              AdminCustomTextfield(
                  controller: Provider.of<AdminProvider>(context, listen: false)
                      .orgNameController,
                  hintText: "Organizer Name"),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: AdminCustomTextfield(
                      hintText: "No: ",
                      controller:
                          Provider.of<AdminProvider>(context, listen: false)
                              .streetNoController,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 350,
                    child: AdminCustomTextfield(
                      hintText: "Street Name",
                      controller:
                          Provider.of<AdminProvider>(context, listen: false)
                              .streetNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AdminCustomTextfield(
                hintText: "Town ",
                controller: Provider.of<AdminProvider>(context, listen: false)
                    .townController,
              ),
              const SizedBox(height: 8),
              AdminCustomTextfield(
                hintText: "Description ",
                controller: Provider.of<AdminProvider>(context, listen: false)
                    .descriptionController,
              ),
              const SizedBox(height: 8),
              AdminCustomTextfield(
                hintText: "Price for hour ",
                controller: Provider.of<AdminProvider>(context, listen: false)
                    .priceController,
              ),
              const SizedBox(height: 8),
              IntlPhoneField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.primaryAshOne,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.red)),
                ),
                initialCountryCode: 'LK',
                controller: Provider.of<AdminProvider>(context, listen: false)
                    .mobileController,
              ),
              //--------------------------------checkboxes
              Row(
                children: [
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.wedding,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setWedding = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Wedding",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.bday,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setBday = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Birthday",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.engage,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setEngage = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Engagement",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.aniversary,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setAniversary = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Aniversary",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.office,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setOffice = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Office",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Consumer<AdminProvider>(
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value.exhibition,
                            activeColor: AppColors.primaryColor,
                            onChanged: (cValue) {
                              value.setExhibition = cValue!;
                            },
                          );
                        },
                      ),
                      const CustomText(
                        "Exhibition",
                        fontSize: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 29),
              Consumer<AdminProvider>(
                builder: (context, value, child) {
                  return CustomButton(isLoading: value.isLoading, onTap: () {
                    value.startSaveOrganizerData();
                  }, "Save Product");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
