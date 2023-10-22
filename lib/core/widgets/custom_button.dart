import 'package:flutter/material.dart';
import 'package:my_bookly/styles.dart';

class CusttomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  const CusttomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.onPressed,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(fontWeight: FontWeight.w800, color: textColor),
        ),
      ),
    );
  }
}
