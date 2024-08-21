import 'package:flutter/material.dart';

import '../constan/colors.dart';
import '../constan/integer.dart';

class LeonCardView extends StatelessWidget {
  final Widget child;
  final Color cardColor;
  final double borderRadius;
  final double borderWidth;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final VoidCallback onPressed;
  const LeonCardView(
      {super.key,
      required this.child,
      this.borderRadius = 10,
      this.elevation = 0,
      this.margin = EdgeInsets.zero,
      required this.padding,
      required this.onPressed,
      required this.cardColor,
      required this.borderColor,
      this.borderWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
          )),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class LeonCardTopShadow extends StatelessWidget {
  final double width;
  // final double height;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final Widget child;
  const LeonCardTopShadow({
    super.key,
    required this.width,
    // required this.height,
    required this.color,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.child, required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0, // Adjust elevation for the shadow effect
      shadowColor: shadowColor,
      child: Container(
        width: width,
        // height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlurRadius,
              offset: shadowOffset,
            ),
          ],
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}

class LeonCardBottomShadow extends StatelessWidget {
  final double width;
  final Color color;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const LeonCardBottomShadow({
    super.key,
    required this.width,
    required this.color,
    this.shadowColor = const Color.fromARGB(25, 0, 0, 0),
    this.shadowBlurRadius = 4,
    required this.shadowOffset,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: width,
        padding: padding ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlurRadius,
              offset: shadowOffset,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class LeonCardLeftPrimary extends StatelessWidget {
  const LeonCardLeftPrimary({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.bgPrimary),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        shadowColor: Colors.black,
        // color: Colors.white,
        child: ClipPath(
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppInteger.gSpace10))),
            child: Container(
                padding: const EdgeInsets.all(AppInteger.gSpace10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: AppColors.bgPrimary, width: 5),
                    right: BorderSide(color: AppColors.bgPrimary, width: 1),
                    top: BorderSide(color: AppColors.bgPrimary, width: 1),
                    bottom: BorderSide(color: AppColors.bgPrimary, width: 1),
                  ),
                ),
                child: child)));
  }
}
