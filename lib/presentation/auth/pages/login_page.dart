import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:istanbulguidetwo/common/bloc/button/button_state_cubit.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/common/widget/button/basic_reactive_button.dart';
import 'package:istanbulguidetwo/core/config/assets/app_images.dart';
import 'package:istanbulguidetwo/core/utils/size_config.dart';
import 'package:istanbulguidetwo/data/auth/models/user_login_req.dart';
import 'package:istanbulguidetwo/domain/auth/usecase/login_usecase.dart';
import 'package:istanbulguidetwo/presentation/auth/pages/forgot_password_page.dart';
import 'package:istanbulguidetwo/presentation/auth/pages/register_page.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../core/config/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonSuccessState) {}
          },
          child: Stack(
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
                          _loginText(context),
                          SizedBox(height: SizeConfig.heightMultiplier(4)),
                          _emailTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _passwordTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _forgotPasswordText(context),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier(3)),
                          _loginButton(context),
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
        ),
      ),
    );
  }

  Widget _loginText(BuildContext context) {
    return Text(
      'Log In',
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
        controller: _emailCon,
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
        controller: _passwordCon,
        decoration: InputDecoration(hintText: 'Password'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const ForgotPasswordPage());
      },
      child: Text(
        'Forgot password?',
        style: TextStyle(
          fontSize: SizeConfig.textMultiplier(3.3),
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'San Francisco',
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            final userLoginReq = UserLoginReq(
                email : _emailCon.text,
                password : _passwordCon.text
            );

            context.read<ButtonStateCubit>().execute(
              usecase: LoginUseCase(),
              params: userLoginReq,
            );
          },
          title: 'Log in',
        );
      },
    );
  }

  Widget _createAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyle(fontSize: SizeConfig.textMultiplier(3.3)),
          ),
          TextSpan(
            text: 'Create account!',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, RegisterPage());
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
