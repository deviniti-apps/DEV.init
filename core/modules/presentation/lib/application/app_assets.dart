import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const package = 'presentation';

  static const String _assetsPath = 'assets';
  // ignore: unused_field
  static const String _imagePath = '$_assetsPath/images';
  // ignore: unused_field
  static const String _svgPath = '$_assetsPath/svg';
}

extension Assets on BuildContext {
  AssetImage assetImage(String name) => AssetImage(name, package: AppAssets.package);

  SvgPicture svgImage(String name, {Color? color, Size? size}) => SvgPicture.asset(
        name,
        package: AppAssets.package,
        color: color,
        width: size?.width,
        height: size?.height,
      );
}
