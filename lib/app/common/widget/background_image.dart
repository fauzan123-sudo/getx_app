import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/icon.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppIcon.iBackground),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
        ),
        child: child);
  }
}
