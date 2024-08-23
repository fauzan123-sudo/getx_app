import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/color_custom.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';

class LeonCardView extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  final Color solidColor;
  final bool useGradient;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final double strokeWidth;
  final Color strokeColor;

  const LeonCardView({
    super.key,
    required this.child,
    this.gradient = AppColors.customGradient,
    this.solidColor = AppColors.bgPrimary,
    this.useGradient = true,
    this.borderRadius = 10,
    required this.elevation,
    required this.padding,
    required this.strokeWidth,
    required this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: useGradient ? null : solidColor,
            gradient: useGradient ? gradient : null,
            border: Border.all(
              width: strokeWidth,
              color: strokeColor,
            ),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class LeonCardList extends StatelessWidget {
  const LeonCardList({
    super.key,
    this.date,
    this.label,
    this.statusString,
    this.description,
    this.cost,
  });

  final String? date;
  final int? label;
  final String? description;
  final String? statusString;
  final String? cost;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date ?? '',
                        style: LeonTextStyles.poppins10MediumBlack()),
                    Container(
                        decoration: BoxDecoration(
                            color: getStatusColor(label ?? 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))
                            // border: Border.all()
                            ),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(statusString ?? '',
                            style: LeonTextStyles.poppins8BoldWhite())),
                  ],
                ),
                Text(description ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: LeonTextStyles.poppins10SemiBoldBlack()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: LeonTextStyles.poppins10MediumBlack()),
                    Text(cost ?? '',
                        style: LeonTextStyles.poppins10BoldDanger()),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
