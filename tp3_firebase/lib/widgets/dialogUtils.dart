import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(
    BuildContext context,
    bool isLoading,
    {String? message}
  ) {
    if (isLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text(message ?? ''),
              ],
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
