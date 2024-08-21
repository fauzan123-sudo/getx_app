import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class LeonSvg extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;
  final VoidCallback onTap;

  const LeonSvg({
    super.key,
    required this.assetName,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        width: width,
        height: height,
      ),
    );
  }
}

class LeonSvgNoSize extends StatelessWidget {
  final String assetName;
  final VoidCallback onTap;
  final Color? color;
  final Color? lineColor;
  final Color? fillColor;

  const LeonSvgNoSize({
    super.key,
    required this.assetName,
    required this.onTap,
    this.color,
    this.lineColor,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: color != null
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
              child: SvgPicture.asset(
                assetName,
              ),
            )
          : SvgPicture.asset(
              assetName,
            ),
    );
  }
}

class LeonSvgNoSizeNoTap extends StatelessWidget {
  final String assetName;
  // final VoidCallback onTap;
  final Color? color;
  final Color? lineColor;
  final Color? fillColor;

  const LeonSvgNoSizeNoTap({
    super.key,
    required this.assetName,
    // required this.onTap,
    this.color,
    this.lineColor,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      child: color != null
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
              child: SvgPicture.asset(
                assetName,
              ),
            )
          : SvgPicture.asset(
              assetName,
            ),
    );
  }
}
