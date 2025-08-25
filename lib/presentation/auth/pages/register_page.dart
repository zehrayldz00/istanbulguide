import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/common/widget/button/app_button.dart';
import 'package:istanbulguidetwo/core/config/utils/size_config.dart';
import 'package:istanbulguidetwo/presentation/auth/pages/login_page.dart';
import 'package:istanbulguidetwo/presentation/home/pages/home_page.dart';

import '../../../core/config/assets/app_images.dart';
import '../../../core/config/theme/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                      SizedBox(height: SizeConfig.heightMultiplier(8)),
                      _registerText(context),
                      SizedBox(height: SizeConfig.heightMultiplier(4)),
                      _nameTextField(context),
                      SizedBox(height: SizeConfig.heightMultiplier(2)),
                      _emailTextField(context),
                      SizedBox(height: SizeConfig.heightMultiplier(2)),
                      _passwordTextField(context),
                      SizedBox(height: SizeConfig.heightMultiplier(2)),
                      SizedBox(height: SizeConfig.heightMultiplier(3)),
                      _registerButton(context),
                      SizedBox(height: SizeConfig.heightMultiplier(2)),
                      _createAccountText(context),
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

  Widget _registerText(BuildContext context) {
    return Text(
      'Register',
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier(10),
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _nameTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(80),
      height: SizeConfig.heightMultiplier(6),
      child: TextField(
        decoration: InputDecoration(hintText: 'Name'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
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

  Widget _passwordTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(80),
      height: SizeConfig.heightMultiplier(6),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: 'Password'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, const HomePage());
      },
      title: 'Register',
    );
  }

  Widget _createAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(fontSize: SizeConfig.textMultiplier(3.3)),
          ),
          TextSpan(
            text: 'Log in!',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, const LoginPage());
              },
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier(3.3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
