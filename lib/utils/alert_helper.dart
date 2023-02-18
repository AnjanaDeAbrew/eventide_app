import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  static Future<void> showAlert(
    BuildContext context,
    String title,
    String desc,
    DialogType type,
  ) async {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.scale,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        UtilFunction.goBack(context);
      },
    ).show();
  }
}
