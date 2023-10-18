import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class ShowSnackBar {
  static void snack(BuildContext context,
      {required String title, required String message, required String type}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType:
          type == 'success' ? ContentType.success : ContentType.failure,
    )));
  }
}
