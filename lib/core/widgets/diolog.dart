import 'package:flutter/material.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/styles.dart';

class BooklyDiolog {
  customDiolog(
      {required BuildContext context,
      required Widget child,
      String? title}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null
            ? Text(
                title,
                style: Styles.textStyle16,
              )
            : null,
        content: child,
        elevation: 0,
      ),
    );
  }

  titleWithOneButton({
    required BuildContext context,
    String? title,
    required String fileName,
    required void Function()? onPressed,
    String? buttonText,
  }) {
    return customDiolog(
      context: context,
      title: title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            fileName,
            style: Styles.textStyle14,
          ),
          const SizedBox(height: 10),
          CusttomButton(
            text: buttonText ?? "Open",
            textColor: Colors.white,
            backgroundColor: MyConstants.KprimaryColor,
            onPressed: onPressed,
          ),
        ],
      ),
    );
    ;
  }
}
