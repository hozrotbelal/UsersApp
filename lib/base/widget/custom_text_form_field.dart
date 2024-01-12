import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final String? hint;
  final String? prefixIconPath;
  final bool showVisibilityOptionForPassword, isReadOnly;
  final bool borderNeeded;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintsTextStyle;
  final EdgeInsets margin, contentPadding;
  final TextEditingController formController;
  final TextInputType inputType;
  final Widget? suffixIcon, prefixIcon;
  final GestureTapCallback? onTap;
  final Color colorInputFieldBackground, colorInputFieldBorder;
  final Color textColor, hintColor, iconColor;
  final bool etEnabled;
  const CustomTextFormField({
    Key? key,
    required this.formController,
    required this.inputType,
    this.hint,
    this.textStyle,
    this.hintsTextStyle,
    this.prefixIconPath,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.isReadOnly = false,
    this.borderNeeded = true,
    this.etEnabled = true,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(6.0),
    ),
    this.colorInputFieldBackground = colorBgGreyF8,
    this.colorInputFieldBorder = colorBgGreyF8, //const Color(0xFFF3F2F2),
    this.textColor = const Color(0xFF272B37),
    this.hintColor = const Color(0xFF707586),
    this.iconColor = const Color(0xD1272B37),
    this.showVisibilityOptionForPassword = true,
    this.margin = const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
      top: 12.0,
    ),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 6.0),
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isTextVisible;

  @override
  void initState() {
    _isTextVisible = widget.inputType != TextInputType.visiblePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.colorInputFieldBackground,
        borderRadius: widget.borderRadius,
        border: widget.borderNeeded
            ? Border.fromBorderSide(
                BorderSide(color: widget.colorInputFieldBorder),
              )
            : null,
      ),
      padding: ((widget.prefixIconPath != null && widget.prefixIconPath!.trim().isNotEmpty) || (widget.prefixIcon != null))
          ? ((widget.inputType == TextInputType.visiblePassword && widget.showVisibilityOptionForPassword) ? EdgeInsets.zero : const EdgeInsets.only(right: 16.0))
          : ((widget.inputType == TextInputType.visiblePassword && widget.showVisibilityOptionForPassword) || (widget.suffixIcon != null))
              ? const EdgeInsets.only(left: 16.0)
              : const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.isReadOnly,
        obscureText: !_isTextVisible,
        style: widget.textStyle ??
            TextStyle(
              color: widget.textColor,
              fontSize: 14.0,
              fontFamily: fontFamilyQuicksand,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          prefixIcon: (widget.prefixIconPath != null && widget.prefixIconPath!.trim().isNotEmpty)
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.asset(
                    widget.prefixIconPath!,
                    color: widget.iconColor,
                    fit: BoxFit.contain,
                    height: 20.0,
                  ),
                )
              : widget.prefixIcon,
          suffixIcon: (widget.inputType == TextInputType.visiblePassword && widget.showVisibilityOptionForPassword)
              ? GestureDetector(
                  child: Icon(
                    // Based on passwordVisible state choose the icon
                    _isTextVisible ? Icons.visibility_off : Icons.visibility,
                    color: widget.iconColor,
                  ),
                  onTap: () {
                    setState(() {
                      _isTextVisible = !_isTextVisible;
                    });
                  },
                )
              : widget.suffixIcon,
          contentPadding: widget.contentPadding,
          hintStyle: widget.hintsTextStyle ??
              TextStyle(
                color: widget.hintColor,
                fontSize: 13.0,
                fontFamily: fontFamilyQuicksand,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: widget.hint,
        ),
        controller: widget.formController,
        enabled: widget.etEnabled,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],
      ),
    );
  }
}
