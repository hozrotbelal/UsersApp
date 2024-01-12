import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class CustomButtonWithoutShadowWidget extends StatelessWidget {
  const CustomButtonWithoutShadowWidget({
    Key? key,
    required this.onPressed,
    this.color,
    this.onPrimaryColor,
    this.text = "",
    this.textAlign = TextAlign.left,
    this.borderSideColor = colorLightGray3,
    this.boxHeight = 45,
    this.margin = const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
      top: 12.0,
    ),
    this.padding = const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0),
    this.borderRadius = const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    this.centerWidget,
    this.rightWidget,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  final Color? color;
  final Color? onPrimaryColor;
  final String text;
  final Color? borderSideColor;
  final double? boxHeight;
  final Color? textColor;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final EdgeInsetsGeometry padding;
  final EdgeInsets margin;
  final TextAlign textAlign;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: boxHeight,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: onPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: borderSideColor ?? colorWhite),
          ),
          child: Text(text,
              softWrap: false,
              textAlign: textAlign,
              style: textStyle ??
                  Get.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    fontFamily: fontFamilyQuicksand,
                    color: textColor,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
        ),
      ),
    );
  }
}
