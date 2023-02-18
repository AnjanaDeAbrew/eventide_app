import 'dart:ui';

import 'package:eventide_app/components/custom_button.dart';
import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final DateRangePickerController _dateController = DateRangePickerController();
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  // Initial Selected Value
  String? dropdownvalue;

  List<Map> myJson = [
    {'id': '1', 'image': AssetConstant.morning, 'value': 'Morning'},
    {'id': '2', 'image': AssetConstant.day, 'value': 'Day'},
    {'id': '3', 'image': AssetConstant.evening, 'value': 'Evening'},
    {'id': '4', 'image': AssetConstant.night, 'value': 'Night'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 200,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    image: DecorationImage(
                        image: NetworkImage(AssetConstant.coverImage),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        //---------------arrow back box
                        InkWell(
                          onTap: () {
                            UtilFunction.goBack(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 40, sigmaY: 50),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                              255, 90, 107, 134)
                                          .withOpacity(0.5)),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: size.width,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.white.withOpacity(.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            "text",
                            fontSize: 25,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                "Select the date",
                fontSize: 25,
                color: AppColors.black,
              ),
              SfDateRangePicker(
                controller: _dateController,
                backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                onSelectionChanged: _onSelectionChanged,
                selectionColor: AppColors.primaryColor,
                todayHighlightColor: AppColors.primaryColor,
                headerStyle: const DateRangePickerHeaderStyle(
                    textStyle: TextStyle(color: AppColors.white, fontSize: 18),
                    backgroundColor: AppColors.primaryColor),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CustomText(
                    "Select the time",
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: DropdownButtonFormField(
                      // Initial Value
                      value: dropdownvalue,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: myJson.map((items) {
                        return DropdownMenuItem(
                          value: items['id'].toString(),
                          child: Row(
                            children: [
                              Image.asset(
                                items['image'],
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(items['value'])
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  "Book Now",
                  color: AppColors.bottomColor,
                  height: 65,
                  width: 400,
                  onTap: () {
                    UtilFunction.navigateTo(context, const BookingPage());
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
        print(_selectedDate);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
}
