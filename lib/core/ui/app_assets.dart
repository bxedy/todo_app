import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const _iconsPath = "assets/icons";
  static const _imagesPath = "assets/images";
  static const _logoPath = "assets/logo";

  /// Logo
  static const logo = '$_logoPath/taski_logo.svg';

  /// Images
  static const avatar = '$_imagesPath/avatar.png';

  /// Icons
  static const checked = '$_iconsPath/checked.svg';
  static const emptyStateIllustration =
      '$_iconsPath/empty_state_illustration.svg';
  static const plus = '$_iconsPath/plus.svg';
  static const search = '$_iconsPath/search.svg';
  static const todo = '$_iconsPath/todo.svg';
}

extension AppAssetExt on String {
  AppAsset svgPictureFromPath({
    String? icon,
    double? size,
    BoxFit? fit,
    Color? color,
    double? width,
    double? height,
    Function()? onTap,
  }) {
    return AppAsset(
      icon: this,
      fit: fit,
      color: color,
      width: width,
      height: height,
      onTap: onTap,
    );
  }
}

class AppAsset extends StatelessWidget {
  final String? icon;
  final BoxFit? fit;
  final Color? color;
  final double? size;
  final double? height;
  final double? width;
  final Function()? onTap;

  const AppAsset({
    super.key,
    this.icon,
    this.fit,
    this.color,
    this.size,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        icon ?? AppAssets.logo,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit ?? BoxFit.scaleDown,
        width: width ?? 24,
        height: height ?? 24,
      ),
    );
  }
}
