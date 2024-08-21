import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';


class LeonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LeonAppBar(
      {super.key,
      this.title,
      required this.showBackArrow,
      this.leadingAvatar,
      this.actions,
      this.leadingOnPress});

  final Widget? title;
  final bool showBackArrow;
  final CircleAvatar? leadingAvatar;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(AppInteger.gSpace20,
            AppInteger.gSpace20, AppInteger.gSpace20, AppInteger.gSpace15),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: LeonSvg(
                    assetName: AppIcon.iBackArrow,
                    width: AppInteger.gSpace20,
                    height: AppInteger.gSpace20,
                    onTap: () {
                      Get.back();
                    },
                  ))
              : leadingAvatar != null
                  ? GestureDetector(
                      onTap: leadingOnPress,
                      child: leadingAvatar,
                    )
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppInteger.gSpace20);
}

class LeonAppBarWithBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const LeonAppBarWithBottom({
    super.key,
    this.title,
    required this.showBackArrow,
    this.leadingAvatar,
    this.actions,
    this.leadingOnPress,
  });

  final Widget? title;
  final bool showBackArrow;
  final CircleAvatar? leadingAvatar;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(AppInteger.gSpace20,
            AppInteger.gSpace20, AppInteger.gSpace20, AppInteger.gSpace15),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: LeonSvg(
                    assetName: AppIcon.iBackArrow,
                    width: AppInteger.gSpace20,
                    height: AppInteger.gSpace20,
                    onTap: () {},
                  ))
              : leadingAvatar != null
                  ? GestureDetector(
                      onTap: leadingOnPress,
                      child: leadingAvatar,
                    )
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppInteger.gSpace20);
}

class LeonAppBarNavBack extends AppBar {
  LeonAppBarNavBack({
    super.key,
    required String title,
    required String subTitle,
    super.actions,
    super.backgroundColor,
    leading,
  }) : super(
          titleSpacing: 20,
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: LeonSvgNoSize(assetName: AppIcon.iBackArrow, onTap: () {
              Get.back();
            }),
          ),
          title: Column(
            children: [
              Text(
                title,
                style: LeonTextStyles.poppins12BoldBlack(),
              ),
              Text(subTitle, style: LeonTextStyles.poppins10RegularBlack()),
            ],
          ),
        );
}
