import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/common/widget/button/app_button.dart';
import 'package:istanbulguidetwo/core/config/utils/size_config.dart';
import 'package:istanbulguidetwo/presentation/home/pages/home_page.dart';

import '../../../core/config/assets/app_images.dart';
import '../../../core/config/theme/app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                      _resetPasswordText(context),
                      SizedBox(height: SizeConfig.heightMultiplier(5)),
                      _emailTextField(context),
                      SizedBox(height: SizeConfig.heightMultiplier(7)),
                      _resetPasswordButton(context),
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

  Widget _resetPasswordText(BuildContext context) {
    return Text(
      'Reset Password',
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier(10),
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(80),
      height: SizeConfig.heightMultiplier(6),
      child: TextField(
        decoration: InputDecoration(hintText: 'Email'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _resetPasswordButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, const HomePage());
      },
      title: 'Reset Password',
    );
  }
}
