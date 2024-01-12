import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.onPressed,
      this.color,
      this.onPrimaryColor,
      this.text = "",
      this.textAlign = TextAlign.left,
      this.borderSideColor = colorLightGray3,
      this.boxHeight,
      this.circleAvatar = false,
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
      this.textStyle = textStyleButtonRegular})
      : super(key: key);

  final Color? color;
  final Color? onPrimaryColor;
  final String text;
  final Color? borderSideColor;
  final double? boxHeight;
  final Color? textColor;
  final bool circleAvatar;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final EdgeInsetsGeometry padding;
  final EdgeInsets margin;
  final TextAlign textAlign;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: onPrimaryColor ?? colorLightGray3,
            shape: RoundedRectangleBorder(borderRadius: borderRadius, side: BorderSide(color: borderSideColor!)),
          ),
          onPressed: onPressed,
          child: SizedBox(
            height: boxHeight ?? 50,
            width: double.infinity,
            child: Container(
              padding: padding,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: centerWidget ??
                        Text(
                          text,
                          textAlign: textAlign,
                          style: textStyle,
                        ),
                  ),
                  if (circleAvatar)
                    (CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.chevron_right, color: onPrimaryColor),
                    ))
                  else
                    rightWidget ?? const Text('')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
