import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../core/config/assets/app_images.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/utils/size_config.dart';

class ResetEmailSentPage extends StatelessWidget {
  const ResetEmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: SizeConfig.heightMultiplier(60),
                width: SizeConfig.screenWidth,
                color: AppColors.secondBackGround,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.widthMultiplier(10),
                    left: SizeConfig.widthMultiplier(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.heightMultiplier(10)),
                      _resetEmailSentText(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resetEmailSentText(BuildContext context) {
    return Text(
      'Reset email sent. Please check your inbox.',
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier(5),
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
