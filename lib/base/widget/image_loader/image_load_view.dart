import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/enum/enum.dart';

class ImageLoadView extends StatelessWidget {
  final String? path;
  final double radius;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String placeholder;
  final ImageType imageType;
  final double opacity;
  final double sigmaX;
  final double sigmaY;
  final Color filterColor;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final AlignmentGeometry alignment;
  final double elevation;
  final BoxShape shape;
  final Color? borderColor;
  final double borderWidth;

  const ImageLoadView(
    this.path, {
    Key? key,
    this.radius = 0.0,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.fit = BoxFit.cover,
    this.placeholder = loadingImage,
    this.imageType = ImageType.network,
    this.opacity = 1.0,
    this.sigmaX = 0.0,
    this.sigmaY = 0.0,
    this.filterColor = Colors.transparent,
    this.child,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.elevation = 0.0,
    this.shape = BoxShape.rectangle,
    this.borderColor,
    this.borderWidth = 0.0,
  })  : assert(path != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = CachedNetworkImage(placeholder: (context, url) => Image(image: AssetImage(placeholder)), imageUrl: path!, fit: fit, errorWidget: (context, url, error) => Image.asset(placeholder));
        break;
      case ImageType.assets:
        imageWidget = FadeInImage(placeholder: AssetImage(placeholder), image: AssetImage(path!), fit: fit);
        break;
      case ImageType.localFile:
        imageWidget = FadeInImage(placeholder: AssetImage(placeholder), image: FileImage(File(path!)), fit: fit);
        break;
    }

    return Card(
      color: Colors.transparent,
      shape: shape == BoxShape.circle ? const CircleBorder() : RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      margin: margin,
      child: SizedBox(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: imageWidget),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  shape: shape,
                  borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(radius),
                  border: Border.all(color: borderColor ?? Theme.of(context).primaryColor, width: borderWidth, style: borderWidth == 0.0 ? BorderStyle.none : BorderStyle.solid),
                ),
              ),
            ),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY), child: Opacity(opacity: opacity, child: Container(color: filterColor, child: child ?? const SizedBox(), alignment: alignment, padding: padding)))
          ],
        ),
      ),
    );
  }
}
