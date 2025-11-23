import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:istanbulguidetwo/common/bloc/button/button_state_cubit.dart';
import 'package:istanbulguidetwo/common/widget/button/basic_reactive_button.dart';
import 'package:istanbulguidetwo/core/utils/size_config.dart';
import 'package:istanbulguidetwo/data/auth/models/user_creation_req.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../domain/auth/usecase/register_usecase.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
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
                          SizedBox(height: SizeConfig.heightMultiplier(8)),
                          _registerText(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _nameTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _lastNameTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _emailTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _passwordTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _registerButton(context),
                          SizedBox(height: SizeConfig.heightMultiplier(2)),
                          _existAccountText(context),
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

  Widget _registerText(BuildContext context) {
    return Text(
      'Register',
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier(8),
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _nameTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(64),
      height: SizeConfig.heightMultiplier(4.8),
      child: TextField(
        controller: _nameCon,
        decoration: InputDecoration(hintText: 'Name'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _lastNameTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(64),
      height: SizeConfig.heightMultiplier(4.8),
      child: TextField(
        controller: _lastNameCon,
        decoration: InputDecoration(hintText: 'Last Name'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(64),
      height: SizeConfig.heightMultiplier(4.8),
      child: TextField(
        controller: _emailCon,
        decoration: InputDecoration(hintText: 'Email'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(64),
      height: SizeConfig.heightMultiplier(4.8),
      child: TextField(
        controller: _passwordCon,
        obscureText: true,
        decoration: InputDecoration(hintText: 'Password'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            final userCreationReq = UserCreationReq(
              firstName: _nameCon.text,
              lastName: _lastNameCon.text,
              email: _emailCon.text,
              password: _passwordCon.text,
            );

            context.read<ButtonStateCubit>().execute(
              usecase: RegisterUseCase(),
              params: userCreationReq,
            );
          },
          title: 'Register',
        );
      },
    );
  }

  Widget _existAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(fontSize: SizeConfig.textMultiplier(3)),
          ),
          TextSpan(
            text: 'Log in!',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              AppNavigator.pushAndRemove(context, LoginPage());
              },
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier(3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
