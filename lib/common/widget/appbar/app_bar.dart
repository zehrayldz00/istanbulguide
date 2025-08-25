import 'package:flutter/material.dart';
import 'package:istanbulguidetwo/core/config/utils/size_config.dart';

import '../../../core/config/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  const BasicAppBar({
    super.key,
    this.title,
    this.action,
    this.backgroundColor,
    this.hideBack = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: SizeConfig.heightMultiplier(6),
                width: SizeConfig.widthMultiplier(6),
                decoration: const BoxDecoration(
                  color: AppColors.secondBackGround,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: SizeConfig.heightMultiplier(2),
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height ?? SizeConfig.heightMultiplier(5));
}
