import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar(this.hintText,
      {this.color = AppColors.primaryAshOne, super.key});

  final List<String> organizers = [
    "1.Magical Moments (Pvt) Ltd",
    "2.Wedding Sri Lanka (Pvt) Ltd",
    "Johens Events (Pvt) Ltd",
    "3.Lassana Flora (Pvt) Ltd",
    "4 Eventride (Pvt) Ltd",
    "5 tripical Moments (Pvt) Ltd",
    "6 birth Sri Lanka (Pvt) Ltd",
    "7 Johens Events (Pvt) Ltd",
    "8 aalnaka Flora (Pvt) Ltd",
    "9 maliban (Pvt) Ltd",
    "10 Magical Moments (Pvt) Ltd",
    "11 Wedding Sri Lanka (Pvt) Ltd",
    "12 Johens Events (Pvt) Ltd",
    "13 Lassana Flora (Pvt) Ltd",
    "14 Eventride (Pvt) Ltd"
  ];

  final String hintText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RawAutocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == '') {
        return const Iterable<String>.empty();
      } else {
        List<String> matches = <String>[];
        matches.addAll(organizers);

        matches.retainWhere((s) {
          return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
        return matches;
      }
    }, onSelected: (String selection) {
      print('You just selected $selection');
    }, fieldViewBuilder: (BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted) {
      return TextField(
        controller: textEditingController,
        focusNode: focusNode,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {}, icon: Image.asset(AssetConstant.searchPath)),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryAshThree),
          fillColor: color,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.primaryAshOne)),
        ),
      );
    }, optionsViewBuilder: (BuildContext context,
        void Function(String) onSelected, Iterable<String> options) {
      return Material(
          child: Container(
              margin: const EdgeInsets.only(right: 35),
              height: 100,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options.map((opt) {
                  return InkWell(
                    onTap: () {
                      onSelected(opt);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      width: 450,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 2),
                      child: CustomText(
                        opt,
                        fontSize: 15,
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                }).toList(),
              ))));
    });
  }
}
