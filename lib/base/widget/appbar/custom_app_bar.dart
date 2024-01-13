import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color bgColor;
  final bool isBackButtonExist;
  final IconData? icon;
  final IconData? leadingIcon;
  final Function? onActionPressed;
  final Function? onBackPressed;
  final VoidCallback? onTitlePressed;
  final Widget? leadingChild;
  final Widget? actionChild;
  final Widget? horizontalChild;
  final Widget? verticalChild;
  final double appBarHeight;
  final EdgeInsets paddindAppBar;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleStyle = const TextStyle(
      color: colorTextGrey2E,
      fontSize: Dimensions.fontSizeextraLarge,
      fontFamily: fontFamilyQuicksand,
      fontWeight: FontWeight.w500,
      letterSpacing: .30,
    ),
    this.bgColor = colorWhite,
    this.isBackButtonExist = true,
    this.icon,
    this.onActionPressed,
    this.onBackPressed,
    this.onTitlePressed,
    this.leadingChild,
    this.leadingIcon,
    this.actionChild,
    this.horizontalChild,
    this.verticalChild,
    this.appBarHeight = 60,
    this.paddindAppBar = const EdgeInsets.only(top: 8.0, bottom: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: paddindAppBar,
          //  height: appBarHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.circular(0.0),
            color: bgColor,
            boxShadow: const [
              BoxShadow(
                color: colorBg2GreyF1,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                  isBackButtonExist
                      ? IconButton(
                          icon: leadingIcon != null
                              ? Icon(
                                  leadingIcon,
                                ) // color: colorTextGrey5A
                              : SvgPicture.asset(
                                  assetSvgIcLeftArrow,
                                  fit: BoxFit.contain,
                                ),
                          onPressed: () => onBackPressed != null ? onBackPressed!() : Get.back(),
                        )
                      : const SizedBox.shrink(),
                  leadingChild ?? const SizedBox.shrink(),
                  if (title.isNotEmpty)
                    Expanded(
                      child: Offstage(
                        offstage: title.isEmpty || title == "",
                        child: InkResponse(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: onTitlePressed,
                          child: Text(
                            title,
                            style: titleStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  horizontalChild ?? const SizedBox(),
                  actionChild ?? const SizedBox(),
                  icon != null
                      ? IconButton(
                          icon: Icon(icon, size: Dimensions.iconSizeLarge, color: Colors.white),
                          onPressed: onActionPressed!(),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Container(
                child: verticalChild,
              )
            ],
          ),
        ),
      ],
    );
  }
}
